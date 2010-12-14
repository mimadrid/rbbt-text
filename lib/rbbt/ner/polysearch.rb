require 'rbbt-util'
require 'rbbt/util/open'
require 'rbbt/ner/regexpNER'
#require 'rbbt/ner/dictionaryNER'

# Find terms in the Polysearch thesauri using simple regular expression
# matching. Note that the first time the methods are used the correspondent
# thesaurus are loaded into memory. The available thesauri are: disease, drug,
# metabolite, organ, subcellular (subcellular localization) and tissue.
module Polysearch

  Rbbt.add_datafiles "organ"      => ['Polysearch','http://wishart.biology.ualberta.ca/polysearch/include/organ_ID.txt']
  Rbbt.add_datafiles "tissue"     => ['Polysearch','http://wishart.biology.ualberta.ca/polysearch/include/tissue_ID.txt']
  Rbbt.add_datafiles "location"   => ['Polysearch','http://wishart.biology.ualberta.ca/polysearch/include/subcellular_localization_ID.txt']
  Rbbt.add_datafiles "disease"    => ['Polysearch','http://wishart.biology.ualberta.ca/polysearch/include/disease_IDlist.txt']
  Rbbt.add_datafiles "drug"       => ['Polysearch','http://wishart.biology.ualberta.ca/polysearch/include/drugnames.txt']
  Rbbt.add_datafiles "metabolite" => ['Polysearch','http://wishart.biology.ualberta.ca/polysearch/include/HMDBnames.txt']
  
  @@names = {}
  def self.type_names(type) #:nodoc:
    @@names[type] ||= TSV.new(Rbbt.find_datafile(type), :single => true, :persistence => true)
  end


  @@indexes = {}
  def self.type_index(type) #:nodoc:
    if $stopwords
      stopwords = $stopwords
    else
      stopwords = []
    end

    case type.to_sym
    when :disease
      stopwords << 'use'
    end

    @@indexes[type] ||= RegExpNER.new(Rbbt.find_datafile(type), :stopwords => stopwords, :persistence =>  true)
  end

  # Find matches in a string of text, the types array specifies which thesauri
  # to use, if if nil it will use all.
  def self.match(text, types = nil)
    if types.nil? 
      types = %w(disease  drug  metabolite  organ  location tissue)
    end

    types = [types] unless Array === types
    types = types.sort

    matches = {}
    types.collect{|type|
      matches.merge!(type_index(type).match(text))
    }

    matches
  end

  # Transform the code into a name, type is the thesaurus to use
  def self.name(type, code)
    type_names(type)[code]
  end

end

if __FILE__ == $0
    text =<<-EOT

     Background  Microorganisms adapt their transcriptome by integrating
     multiple chemical and physical signals from their environment. Shake-flask
     cultivation does not allow precise manipulation of individual culture
     parameters and therefore precludes a quantitative analysis of the
     (combinatorial) influence of these parameters on transcriptional
     regulation. Steady-state chemostat cultures, which do enable accurate
     control, measurement and manipulation of individual cultivation parameters
     (e.g. specific growth rate, temperature, identity of the growth-limiting
     nutrient) appear to provide a promising experimental platform for such a
     combinatorial analysis. Results  A microarray compendium of 170
     steady-state chemostat cultures of the yeast Saccharomyces cerevisiae is
     presented and analyzed. The 170 microarrays encompass 55 unique
     conditions, which can be characterized by the combined settings of 10
     different cultivation parameters. By applying a regression model to assess
     the impact of (combinations of) cultivation parameters on the
     transcriptome, most S. cerevisiae genes were shown to be influenced by
     multiple cultivation parameters, and in many cases by combinatorial
     effects of cultivation parameters. The inclusion of these combinatorial
     effects in the regression model led to higher explained variance of the
     gene expression patterns and resulted in higher function enrichment in
     subsequent analysis. We further demonstrate the usefulness of the
     compendium and regression analysis for interpretation of shake-flask-based
     transcriptome studies and for guiding functional analysis of
     (uncharacterized) genes and pathways. Conclusions  Modeling the
     combinatorial effects of environmental parameters on the transcriptome is
     crucial for understanding transcriptional regulation. Chemostat
     cultivation offers a powerful tool for such an approach. Keywords:
     chemostat steady state samples Cerebellar stroke syndrome
       
    
    EOT

    require 'benchmark'
    require 'ruby-prof'

    puts Benchmark.measure{
      p Polysearch.match(text,'disease')
    }


    RubyProf.start

    Polysearch.match(text,'disease')

    result = RubyProf.stop

    # Print a flat profile to text
    printer = RubyProf::FlatPrinter.new(result)
    printer.print(STDOUT, 0)

    puts Benchmark.measure{
      10.times{ p Polysearch.match(text,'disease') }
    }
 
end