feature "Viewing all messages" do 
  scenario 'a USER CAN VIEW ALL MESAAGES' do 
    visit('/messages')
    expect(page).to have_content('This is a peep!')
  end
end