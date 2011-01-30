# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rbbt-text}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Miguel Vazquez"]
  s.date = %q{2011-01-30}
  s.description = %q{Text mining tools: named entity recognition and normalization, document classification, bag-of-words, dictionaries, etc}
  s.email = %q{miguel.vazquez@fdi.ucm.es}
  s.files = [
    "lib/rbbt/bow/bow.rb",
    "lib/rbbt/bow/dictionary.rb",
    "lib/rbbt/bow/misc.rb",
    "lib/rbbt/ner/NER.rb",
    "lib/rbbt/ner/abner.rb",
    "lib/rbbt/ner/annotations.rb",
    "lib/rbbt/ner/banner.rb",
    "lib/rbbt/ner/oscar3.rb",
    "lib/rbbt/ner/regexpNER.rb",
    "lib/rbbt/ner/token_trieNER.rb",
    "share/install/software/ABNER",
    "share/install/software/BANNER",
    "share/install/software/OSCAR3",
    "share/stopwords"
  ]
  s.homepage = %q{http://github.com/mikisvaz/rbbt-util}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.4.2}
  s.summary = %q{Text mining tools for the Ruby Bioinformatics Toolkit (rbbt)}
  s.test_files = [
    "test/rbbt/bow/test_bow.rb",
    "test/rbbt/bow/test_dictionary.rb",
    "test/rbbt/bow/test_misc.rb",
    "test/rbbt/ner/test_NER.rb",
    "test/rbbt/ner/test_abner.rb",
    "test/rbbt/ner/test_annotations.rb",
    "test/rbbt/ner/test_banner.rb",
    "test/rbbt/ner/test_oscar3.rb",
    "test/rbbt/ner/test_regexpNER.rb",
    "test/rbbt/ner/test_token_trieNER.rb",
    "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rbbt-util>, [">= 0"])
      s.add_runtime_dependency(%q<stemmer>, [">= 0"])
    else
      s.add_dependency(%q<rbbt-util>, [">= 0"])
      s.add_dependency(%q<stemmer>, [">= 0"])
    end
  else
    s.add_dependency(%q<rbbt-util>, [">= 0"])
    s.add_dependency(%q<stemmer>, [">= 0"])
  end
end

