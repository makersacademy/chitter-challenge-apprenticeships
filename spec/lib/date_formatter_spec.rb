require 'date_formatter'

describe DateFormatter do
  describe "#format_date" do
    it 'formats the date in the correct format' do
      date = described_class.format_date('2021-10-14')
      expect(date).to eq '14/10/21'
    end
  end
end
