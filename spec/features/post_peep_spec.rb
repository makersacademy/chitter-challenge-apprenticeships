feature 'post peep' do
  scenario 'you can post a peep' do
    visit '/'
    fill_in 'peep_user', with: 'post peep test user'
    fill_in 'peep_message', with: 'post peep test post'
    click_button 'Submit'

    expect(page).to have_content 'post peep test user'
    expect(page).to have_content 'post peep test post'
  end
end
