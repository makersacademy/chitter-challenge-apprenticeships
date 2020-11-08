feature 'send peep' do
  scenario 'send a peep' do
    signup
    fill_in 'message', with: 'This is a tweet'
    click_button 'Send'
    expect(page).to have_content 'By: Foo'
    expect(page).to have_content 'This is a tweet'
  end
end