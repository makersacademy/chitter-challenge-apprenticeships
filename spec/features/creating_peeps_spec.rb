feature 'adding a new peep' do 
  scenario 'a user can add a new peep' do 
    visit('/peeps/new')
    fill_in('message', with: 'This is another peep')
    click_button('Submit')

    expect(page).to have_content 'This is another peep'
  end
end