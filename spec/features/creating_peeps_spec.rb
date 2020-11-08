feature 'Add a new peep' do
  scenario 'A user can add a peep to the peep board' do
    visit('/')
    fill_in('peeps', with: 'This is my first peep')
    click_button('Submit')

    expect(page).to have_content 'This is my first peep'
  end
end
