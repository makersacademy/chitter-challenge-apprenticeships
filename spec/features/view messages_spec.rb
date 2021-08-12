feature 'Viewing messages' do 
  scenario 'A user can view messages' do
    visit ('/messages')

    expect(page).to have_content "test1"

  end
end 
