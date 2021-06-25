# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Posting peeps' do
  scenario 'user can post a message' do
    visit('/')
    click_button('New Peep')
    expect(current_path).to eq '/new_peep'
    fill_in 'message', :with => 'Hello everyone!'
    click_button 'Post'
    expect(page).to have_content "Hello everyone!"
  end
end
