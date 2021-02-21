require 'user'

describe User do
  subject(:user) {described_class.new('Barry', 'test_password')}
  describe '#name' do
    it 'gives the name of the user' do
      expect(user.name).to eq('Barry')
    end
  end
  describe '#password' do
    it 'gives the password of the user' do
      expect(user.password).to eq('test_password')
    end
  end
end