feature 'Viewing all messages' do
  scenario 'A user can see all the (peeps) from other users' do
    Peep.create(message: 'Hey, how are you?', date: '11/04/20')
    Peep.create(message: 'Chitter is pretty cool!', date: '10/05/20')
    Peep.create(message: 'I am really enjoying Makers!', date: '21/05/20')

    visit('/peeps')

    expect(page).to have_link('11/04/20', href: 'Hey, how are you?')
    expect(page).to have_link('10/05/20', href: 'Chitter is pretty cool!')
    expect(page).to have_link('21/05/20', href: 'I am really enjoying Makers!')
  end
end
