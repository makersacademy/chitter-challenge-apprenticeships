require 'pg'

class Peep

  attr_reader :peep

  def initialize(peep:)
    @peep = peep
  end

  def self.all
    @peeps = ['This is a peep!']
  end
end
