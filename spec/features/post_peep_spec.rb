# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter
feature ' post message' do
  scenario 'post message onto homepage' do
    visit('/peeps/new')
    fill_in('message', with: 'Dont worry, be happy')
    click_button('Post Peep')
    expect(page).to have_content('Dont worry, be happy')
  end
end
