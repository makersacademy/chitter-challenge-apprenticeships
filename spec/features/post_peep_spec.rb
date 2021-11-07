feature 'Post a peep' do
  scenario 'Fill in and submit peep' do
    visit('/home')
    fill_in('message', with: "I'm a new peep!")
    click_button('Post')

    expect(page).to have_content("I'm a new peep!")
  end
  scenario 'Fill in and submit peep' do
    visit('/home')
    fill_in('message', with: "Happy Sunday!")
    click_button('Post')
  
    expect(page).to have_content("Happy Sunday!")
  end
end
