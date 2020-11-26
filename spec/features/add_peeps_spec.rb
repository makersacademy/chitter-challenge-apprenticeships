feature 'Posting peeps' do
  scenario 'a user can add a peep' do
    visit '/peeps/add'
    
    fill_in('peep', with: 'Test peep!')
    click_button 'Submit'
    
    expect(page).to have_content "Test peep!"
  end
end