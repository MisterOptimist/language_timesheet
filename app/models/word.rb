class Word < ActiveRecord::Base
  attr_accessible :english, :khmer, :rndm, :khmersentence, :englishsentence
   def self.random
    rndm = find_by_rndm Date.today
    unless rndm
      update_all :rndm => nil
      rndm = self.order('random()').first
      rndm.update_attribute :rndm, Date.today
    end
    rndm
  end
end
