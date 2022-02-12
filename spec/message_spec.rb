require 'message'

describe Message do
  describe '.all' do
    it 'returns all messages' do
      connection = PG.connect(dbname: 'chitter_test')

      # connection.exec("INSERT INTO peeps (name, message) VALUES ('Bob', 'Test Message 1');")
      # connection.exec("INSERT INTO peeps (name, message) VALUES ('Ron', 'Test Message 2');")

      # messages = Message.all

      # expect(messages).to include("Bob - Test Message 1")
      # expect(messages).to include("Ron - Test Message 2")
      message = Message.create(name: 'Phil', message: 'Phils test message')
      Message.create(name: 'Bill', message: 'Bills test message')
      Message.create(name: 'Jill', message: 'Jills test message')

      messages = Message.all

      expect(messages.length).to eq 3
      expect(messages.first).to be_a Message
      expect(messages.first.id).to eq message.id
      expect(messages.first.name).to eq 'Phil'
      expect(messages.first.message).to eq 'Phils test message'
    end
  end

  describe '.create' do
    it 'creates a new message' do
      # Message.create(name: 'Jon', message: 'Test Message 4')

      # expect(Message.all).to include('Jon - Test Message 4')

      message = Message.create(name: 'Jon', message: 'Test Message 4')
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{message.id};")

      expect(message).to be_a Message
      expect(message.id).to eq persisted_data.first['id']
      expect(message.message).to eq 'Test Message 4'
      expect(message.name).to eq 'Jon'
    end
  end

  describe '.delete' do
    it 'deletes the selected message from the messageboard' do
      message = Message.create(name: 'Colin', message: 'Delete Colins message')

      Message.delete(id: message.id)

      expect(Message.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates the selected message on the messageboard' do
      message = Message.create(name: 'Craig', message: 'To be updated')
      updated_message = Message.update(id: message.id, name: 'Craig2', message: 'Now updated')

      expect(updated_message).to be_a Message
      expect(updated_message.id).to eq message.id
      expect(updated_message.name).to eq 'Craig2'
      expect(updated_message.message).to eq 'Now updated'
    end
  end 
end
