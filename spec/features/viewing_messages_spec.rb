feature 'Viewing messages: ' do
  scenario 'A user can see messages' do
    visit('/')
    click_link 'Messages'
    expect(page).to have_content "Hi Michelle! How are you?"
  end
end
