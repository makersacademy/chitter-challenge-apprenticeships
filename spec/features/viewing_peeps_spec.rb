feature 'See all messages in a browser' do
  scenario 'To see what people are doing, I want to see all the messages' do
    Peep.add(message: 'message 1')
    Peep.add(message: 'message 2')
    Peep.add(message: 'message 3')

    visit('/peeps')
    expect(page).to have_content 'message 1'
    expect(page).to have_content 'message 2'
    expect(page).to have_content 'message 3'
  end
end