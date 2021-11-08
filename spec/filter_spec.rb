require 'filter'

describe Filter do
  context '.query' do
    it 'returns the value stored in class' do
      Filter.include("Hello")
      expect(Filter.query).to eq "Hello"
    end
  end

  context '.include' do
    it 'allows you to set include variable' do
      Filter.include("Hello")
      expect(Filter.query).to eq "Hello"
    end
  end
end