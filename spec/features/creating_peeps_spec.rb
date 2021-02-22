feature 'Adding a new peep' do
  scenario 'A user can add a peep' do
    sign_in_and_submit
    click_link('Make a peep')
    fill_in('message', with: 'New peep!')
    click_button('Submit')
    expect(page).to have_content 'New peep!'
  end
end