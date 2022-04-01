require 'sequence'

describe Sequence do
  context '.order' do
    it 'sets order_by variable' do
      Sequence.order(true)
      expect(Sequence.whatorder).to eq true
    end
  end

  context '.whatorder' do
    it 'returns current value of order_by variable' do
      Sequence.order(false)
      expect(Sequence.whatorder).to eq false
    end
  end
end
