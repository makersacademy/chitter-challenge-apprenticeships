describe Message do 
  describe '.all'
    it 'returns all messages' do 
      messages = Message.all

      expect(messages).to include('This is a chitter challenge')
      expect(messages).to include('I love databases!')
  end 
end 