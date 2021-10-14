require 'domain/peep'
require 'repositories/peep_repository'

describe PeepRepository do
  let(:peep1) { Peep.new("I'm a peep!", DateTime.new(2021, 10, 15), "1")}
  let(:peep2) { Peep.new("I'm a peep too!", DateTime.new(2021, 10, 15), "2")}
  let(:peep3) { Peep.new("I'm a peep three!", DateTime.new(2021, 10, 15), "3")}

  describe '#find_all_peeps' do
    it 'returns all peeps from the peeps table' do
      dto = [
        { "id" => "1", "message" => "I'm a peep!", "time_stamp" => "#{DateTime.new(2021, 10, 15)}" },
        { "id" => "2", "message" => "I'm a peep too!", "time_stamp" => "#{DateTime.new(2021, 10, 14)}" },
        { "id" => "3", "message" => "I'm a peep three!", "time_stamp" => "#{DateTime.new(2021, 10, 13)}" },
      ]
  
      expect(DatabaseConnection).to receive(:query).and_return(dto)
      expect(subject.find_all_peeps).to include(peep1, peep2, peep3)
    end
  end
end
