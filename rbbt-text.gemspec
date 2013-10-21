# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rbbt-text"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Miguel Vazquez"]
  s.date = "2013-10-21"
  s.description = "Text mining tools: named entity recognition and normalization, document classification, bag-of-words, dictionaries, etc"
  s.email = "miguel.vazquez@fdi.ucm.es"
  s.executables = ["get_ppis.rb"]
  s.files = [
    "lib/rbbt/bow/bow.rb",
    "lib/rbbt/bow/dictionary.rb",
    "lib/rbbt/bow/misc.rb",
    "lib/rbbt/corpus/corpus.rb",
    "lib/rbbt/corpus/document.rb",
    "lib/rbbt/corpus/document_repo.rb",
    "lib/rbbt/corpus/sources/pubmed.rb",
    "lib/rbbt/entity/document.rb",
    "lib/rbbt/ner/NER.rb",
    "lib/rbbt/ner/abner.rb",
    "lib/rbbt/ner/banner.rb",
    "lib/rbbt/ner/chemical_tagger.rb",
    "lib/rbbt/ner/finder.rb",
    "lib/rbbt/ner/linnaeus.rb",
    "lib/rbbt/ner/ngram_prefix_dictionary.rb",
    "lib/rbbt/ner/oscar3.rb",
    "lib/rbbt/ner/oscar4.rb",
    "lib/rbbt/ner/patterns.rb",
    "lib/rbbt/ner/regexpNER.rb",
    "lib/rbbt/ner/rnorm.rb",
    "lib/rbbt/ner/rnorm/cue_index.rb",
    "lib/rbbt/ner/rnorm/tokens.rb",
    "lib/rbbt/ner/segment.rb",
    "lib/rbbt/ner/segment/docid.rb",
    "lib/rbbt/ner/segment/named_entity.rb",
    "lib/rbbt/ner/segment/relationship.rb",
    "lib/rbbt/ner/segment/segmented.rb",
    "lib/rbbt/ner/segment/token.rb",
    "lib/rbbt/ner/segment/transformed.rb",
    "lib/rbbt/ner/token_trieNER.rb",
    "lib/rbbt/nlp/genia/sentence_splitter.rb",
    "lib/rbbt/nlp/nlp.rb",
    "lib/rbbt/nlp/open_nlp/sentence_splitter.rb",
    "share/install/software/ABNER",
    "share/install/software/BANNER",
    "share/install/software/ChemicalTagger",
    "share/install/software/Gdep",
    "share/install/software/Geniass",
    "share/install/software/Linnaeus",
    "share/install/software/OSCAR3",
    "share/install/software/OSCAR4",
    "share/install/software/OpenNLP",
    "share/install/software/StanfordParser",
    "share/patterns/drug_induce_disease",
    "share/rnorm/cue_default",
    "share/rnorm/tokens_default",
    "share/wordlists/stopwords"
  ]
  s.homepage = "http://github.com/mikisvaz/rbbt-util"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Text mining tools for the Ruby Bioinformatics Toolkit (rbbt)"
  s.test_files = ["test/rbbt/bow/test_misc.rb", "test/rbbt/bow/test_bow.rb", "test/rbbt/bow/test_dictionary.rb", "test/rbbt/ner/test_ngram_prefix_dictionary.rb", "test/rbbt/ner/test_NER.rb", "test/rbbt/ner/segment/test_named_entity.rb", "test/rbbt/ner/segment/test_transformed.rb", "test/rbbt/ner/segment/test_segmented.rb", "test/rbbt/ner/test_patterns.rb", "test/rbbt/ner/test_segment.rb", "test/rbbt/ner/test_finder.rb", "test/rbbt/ner/test_chemical_tagger.rb", "test/rbbt/ner/test_token_trieNER.rb", "test/rbbt/ner/test_oscar4.rb", "test/rbbt/ner/test_abner.rb", "test/rbbt/ner/test_regexpNER.rb", "test/rbbt/ner/test_rnorm.rb", "test/rbbt/ner/test_banner.rb", "test/rbbt/ner/test_linnaeus.rb", "test/rbbt/nlp/test_nlp.rb", "test/rbbt/nlp/open_nlp/test_sentence_splitter.rb", "test/rbbt/entity/test_document.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rbbt-util>, [">= 4.0.0"])
      s.add_runtime_dependency(%q<stemmer>, [">= 0"])
      s.add_runtime_dependency(%q<libxml-ruby>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_runtime_dependency(%q<rjb>, [">= 0"])
    else
      s.add_dependency(%q<rbbt-util>, [">= 4.0.0"])
      s.add_dependency(%q<stemmer>, [">= 0"])
      s.add_dependency(%q<libxml-ruby>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<rjb>, [">= 0"])
    end
  else
    s.add_dependency(%q<rbbt-util>, [">= 4.0.0"])
    s.add_dependency(%q<stemmer>, [">= 0"])
    s.add_dependency(%q<libxml-ruby>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<rjb>, [">= 0"])
  end
end

