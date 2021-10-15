require_relative 'peep'

# This factory takes a SQL response and wraps it in an instance of the peep class
class PeepFactory
  def self.wrap_peep_response_in_object(peep)
    Peep.new(id: peep['id'], message: peep['message'], date: peep['date'])
  end
end
