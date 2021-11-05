feature 'Display all messages' do
  scenario 'User can see all messages' do
    visit '/post_message'
    fill_in 'peep', with: 'the first peep'
    click_button 'Submit'
    expect(page).to have_content 'the first peep'
  end
end
