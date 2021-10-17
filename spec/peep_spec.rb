require 'peep'

describe Peep do

  @time_now = Time.now
  subject(:peep) { described_class.new("message", @time_now) }

  describe '#initialize' do
    it 'should initizialize with two attributes message and date' do
      expect(peep).to have_attributes(message: "message", date: @time_now)
    end
  end
end
