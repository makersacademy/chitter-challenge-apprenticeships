feature 'User can add a new peep' do
  scenario 'User submites a new peep' do
    visit '/'
    fill_in 'message', with: 'A Bookmark'
    click_button 'Submit'

    expect(page).to have_content 'A Bookmark'
  end
end
