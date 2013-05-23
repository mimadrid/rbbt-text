require 'rbbt'
require 'rjb'
require 'libxml'
require 'rbbt/ner/segment'
require 'rbbt/ner/NER'
require 'rbbt/util/log'

class OSCAR4 < NER
  Rbbt.claim Rbbt.software.opt.OSCAR4, :install, Rbbt.share.install.software.OSCAR4.find

  def self.init
    Rjb::load(nil, jvmargs = ['-Xms1G','-Xmx2G']) unless Rjb.loaded?

    @@OSCAR      ||= Rjb::import('uk.ac.cam.ch.wwmm.oscar.Oscar')
    @@FormatType ||= Rjb::import('uk.ac.cam.ch.wwmm.oscar.chemnamedict.entities.FormatType')
  end

  def self.tagger
    @@tagger ||= @@OSCAR.new()
  end

  def self.match(text,  type = nil)
    self.init

    return [] if text.nil? or text.strip.empty?

    oscar = tagger
    #entities = oscar.findAndResolveNamedEntities(text);
    entities = oscar.findNamedEntities(text);
    it = entities.iterator

    result = []

    while it.hasNext
      entity = it.next
      mention = entity.getSurface
      #inchi = entity.getFirstChemicalStructure(@@FormatType.INCHI)
      #inchi = inchi.getValue() unless inchi.nil?
      inchi = nil

      next unless entity.getType.toString == type unless type.nil?

      NamedEntity.setup mention, entity.getStart, entity.getType, inchi, entity.getConfidence

      result << mention
    end

    result
  end

  def match(*args)
    OSCAR4.match *args
  end
end



