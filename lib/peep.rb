
class Peep
  attr_reader :peeps

  def initialize
    @peeps = [{ user: 'test user', message: 'test peep' }]
  end
end
