# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rbbt-text}
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Miguel Vazquez"]
  s.date = %q{2011-07-05}
  s.default_executable = %q{get_ppis.rb}
  s.description = %q{Text mining tools: named entity recognition and normalization, document classification, bag-of-words, dictionaries, etc}
  s.email = %q{miguel.vazquez@fdi.ucm.es}
  s.executables = ["get_ppis.rb"]
  s.files = [
    "lib/rbbt/bow/bow.rb",
    "lib/rbbt/bow/dictionary.rb",
    "lib/rbbt/bow/misc.rb",
    "lib/rbbt/corpus/corpus.rb",
    "lib/rbbt/corpus/document.rb",
    "lib/rbbt/corpus/document_repo.rb",
    "lib/rbbt/corpus/sources/pubmed.rb",
    "lib/rbbt/ner/NER.rb",
    "lib/rbbt/ner/abner.rb",
    "lib/rbbt/ner/annotations.rb",
    "lib/rbbt/ner/annotations/annotated.rb",
    "lib/rbbt/ner/annotations/named_entity.rb",
    "lib/rbbt/ner/annotations/relations.rb",
    "lib/rbbt/ner/annotations/token.rb",
    "lib/rbbt/ner/annotations/transformed.rb",
    "lib/rbbt/ner/banner.rb",
    "lib/rbbt/ner/chemical_tagger.rb",
    "lib/rbbt/ner/ngram_prefix_dictionary.rb",
    "lib/rbbt/ner/oscar3.rb",
    "lib/rbbt/ner/oscar4.rb",
    "lib/rbbt/ner/patterns.rb",
    "lib/rbbt/ner/regexpNER.rb",
    "lib/rbbt/ner/rnorm.rb",
    "lib/rbbt/ner/rnorm/cue_index.rb",
    "lib/rbbt/ner/rnorm/tokens.rb",
    "lib/rbbt/ner/token_trieNER.rb",
    "lib/rbbt/nlp/genia/sentence_splitter.rb",
    "lib/rbbt/nlp/nlp.rb",
    "share/install/software/ABNER",
    "share/install/software/BANNER",
    "share/install/software/ChemicalTagger",
    "share/install/software/Gdep",
    "share/install/software/Geniass",
    "share/install/software/OSCAR3",
    "share/install/software/OSCAR4",
    "share/install/software/StanfordParser",
    "share/patterns/drug_induce_disease",
    "share/rnorm/cue_default",
    "share/rnorm/tokens_default",
    "share/wordlists/stopwords"
  ]
  s.homepage = %q{http://github.com/mikisvaz/rbbt-util}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Text mining tools for the Ruby Bioinformatics Toolkit (rbbt)}
  s.test_files = ["test/test_helper.rb", "test/rbbt/bow/test_bow.rb", "test/rbbt/bow/test_dictionary.rb", "test/rbbt/bow/test_misc.rb", "test/rbbt/ner/test_regexpNER.rb", "test/rbbt/ner/test_abner.rb", "test/rbbt/ner/test_banner.rb", "test/rbbt/ner/annotations/test_transformed.rb", "test/rbbt/ner/annotations/test_named_entity.rb", "test/rbbt/ner/test_token_trieNER.rb", "test/rbbt/ner/test_annotations.rb", "test/rbbt/ner/test_patterns.rb", "test/rbbt/ner/test_NER.rb", "test/rbbt/ner/test_rnorm.rb", "test/rbbt/ner/test_oscar4.rb", "test/rbbt/ner/test_chemical_tagger.rb", "test/rbbt/ner/test_ngram_prefix_dictionary.rb", "test/rbbt/nlp/test_nlp.rb", "test/rbbt/corpus/test_corpus.rb", "test/rbbt/corpus/test_document.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rbbt-util>, [">= 0"])
      s.add_runtime_dependency(%q<stemmer>, [">= 0"])
      s.add_runtime_dependency(%q<libxml-ruby>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
    else
      s.add_dependency(%q<rbbt-util>, [">= 0"])
      s.add_dependency(%q<stemmer>, [">= 0"])
      s.add_dependency(%q<libxml-ruby>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
    end
  else
    s.add_dependency(%q<rbbt-util>, [">= 0"])
    s.add_dependency(%q<stemmer>, [">= 0"])
    s.add_dependency(%q<libxml-ruby>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
  end
end

