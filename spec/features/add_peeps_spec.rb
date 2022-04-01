feature 'Add a peep' do
  scenario 'A user can  add a peep' do
    visit('/chitter/peeps')
    fill_in('message', :with => 'Leigh')
    click_button('Submit')
    expect(page).to have_content('Leigh')
  end
end
