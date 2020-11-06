feature 'see all messages' do
  scenario 'a user can see all messages' do
    visit ('/peeps')
    expect(page).to have_content 'All Messages'
  end
end
