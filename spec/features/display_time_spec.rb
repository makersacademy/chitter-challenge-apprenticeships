feature 'displaying time/date of a peep' do
  scenario 'a user can see when the peep was posted' do
    visit '/peeps/add'

    fill_in('peep', with: 'Test peep!')
    click_button 'Submit'
    
    expect(page).to have_content "Test peep! #{Time.now}"
  end
end