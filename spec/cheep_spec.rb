# frozen_literal_string: true

require 'cheep'

RSpec.describe Cheep do
  describe '#list function' do
    it '- returns a list of messages' do
      result1 = add_row_to_test_database
      result2 = add_row_to_test_database
      subject = Cheep.list

      expect(subject.size).to eq 2
      expect(subject[0].message).to eq result1[0]['message']
      expect(subject[1].message).to eq result2[0]['message']
    end
  end

  describe '#add function' do
    it '- adds a cheep to the database' do
      result = Cheep.add(message: 'This is testing add!')

      expect(result.message).to eq 'This is testing add!'
    end
  end
end
