feature 'add a peep' do
  scenario 'a user can add a peep to the list of peeps shown' do
    visit('/view_peeps')
    fill_in('message', with: 'This is a peep I have added')
    click_button('PEEP!')

    expect(page).to have_content "This is a peep I have added"
  end
end