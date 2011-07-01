require 'rbbt/ner/annotations/named_entity'
require 'rbbt/ner/annotations/annotated'
require 'rbbt/ner/annotations/transformed'
require 'rbbt/ner/annotations/relations'
require 'rbbt/ner/regexpNER'
require 'rbbt/ner/token_trieNER'
require 'rbbt/nlp/nlp'
require 'stemmer'

class PatternRelExt
  def self.simple_pattern(sentence, patterns)
    patterns = Array === patterns ? patterns : [patterns]
    token_trie = TokenTrieNER.new({})
    Transformed.with_transform(sentence, sentence.annotations, Proc.new{|s| s.type.to_s.upcase}) do |sentence|
      token_trie.merge(TSV.new({:pattern => [patterns]}))
      token_trie.entities(sentence)
    end
  end

  
  def self.transform_key(key)
    case
    when key =~ /(.*)\[entity:(.*)\]/
      chunk_type, chunk_value = $1, $2
      annotation_types = chunk_value.split(",")
      Proc.new{|chunk| (chunk_type == "all" or chunk.type == chunk_type) and 
        (chunk.annotations.values.flatten.select{|a| NamedEntity === a}.collect{|a| a.type.to_s}.flatten & annotation_types).any? }

    when key =~ /(.*)\[code:(.*)\]/
      chunk_type, chunk_value = $1, $2
      annotation_codes = chunk_value.split(",")
      Proc.new{|chunk| (chunk_type == "all" or chunk.type == chunk_type) and 
        (chunk.annotations.values.flatten.select{|a| NamedEntity === a}.collect{|a| a.code}.flatten & annotation_codes).any? }

    when key =~ /(.*)\[stem:(.*)\]/
      chunk_type, chunk_value = $1, $2
      Proc.new{|chunk| (chunk_type == "all" or chunk.type == chunk_type) and 
        chunk.split(/\s+/).select{|w| w.stem == chunk_value.stem}.any?}

    when key =~ /(.*)\[(.*)\]/
      chunk_type, chunk_value = $1, $2
      Proc.new{|chunk| (chunk_type == "all" or chunk.type == chunk_type) and 
        chunk.parts.values.select{|a| a == chunk_value}.any?}

    else
      key
    end
  end

  def self.transform_index(index)
    new = {}

    index.each do |key,next_index|
      if Hash === next_index
        new_key = transform_key(key)
        if Proc === new_key
          new[:PROCS] ||= {}
          new[:PROCS][new_key] = transform_index(next_index)
        else
          new[new_key] = transform_index(next_index)
        end
      else
        new[transform_key(key)] = next_index
      end
    end

    new
  end

  def self.prepare_chunk_patterns(token_trie, patterns, type = nil)
    token_trie.merge(transform_index(TokenTrieNER.process({}, patterns)), type)
  end

  attr_accessor :token_trie, :type
  def new_token_trie
    @token_trie = TokenTrieNER.new({})
  end

  def token_trie
    @token_trie || new_token_trie
  end


  def slack(slack)
    @token_trie.slack = slack
  end
  

  def initialize(patterns, slack = nil, type = nil)
    patterns = case
               when (Hash === patterns or TSV === patterns)
                 patterns
               when Array === patterns
                 {:Relation => patterns}
               when String === patterns
                 {:Relation => [patterns]}
               end

    @type = type

    tokenized_patterns = {}

    patterns.each do |key, values|
      tokenized_patterns[key] = values.collect do |v| 
        Token.tokenize(v, /(NP\[[^\]]+\])|\s+/) 
      end
    end

    PatternRelExt.prepare_chunk_patterns(new_token_trie, tokenized_patterns, type)
    token_trie.slack = slack || Proc.new{|t| t.type != 'O'}
  end

  def match_chunks(chunks)
    token_trie.match(chunks).each do |match|
      match.extend Relationship
    end
  end

  def match_sentences(sentences)
    sentence_chunks = NLP.gdep_chunk_sentences(sentences)

    sentences.zip(sentence_chunks).collect do |sentence, chunks|
      annotation_index = Segment.index(sentence.annotations)
      chunks.each do |chunk|
        Annotated.annotate(chunk, annotation_index[chunk.range])
      end

      match_chunks(chunks)
    end
  end

end
