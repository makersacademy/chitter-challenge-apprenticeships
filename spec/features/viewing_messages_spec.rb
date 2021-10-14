feature 'Viewing messages: ' do
  scenario 'A user can see messages' do
    visit('/')
    click_link 'Messages'
    expect(page).to have_content "Hi Michelle! How are you?"
    expect(page).to have_content "What time is the theatre show tonight?"
  end
end
