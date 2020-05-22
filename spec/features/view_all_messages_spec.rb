require 'pg'

feature 'Viewing all messages' do
  scenario 'seeing all the peeps' do

    Chitter.post_message(message: "Hey, how are you?")
    Chitter.post_message(message: "Chitter is pretty cool!")
    Chitter.post_message(message: "I am really enjoying Makers!")

    visit('/peeps')
  end
end
