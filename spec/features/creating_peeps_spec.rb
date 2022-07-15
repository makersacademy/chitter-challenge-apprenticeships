# in spec/features/creating_peeps_spec.rb

feature 'Adding a new peep' do
  scenario 'A user can add a peep to Chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'An example of a peep')
    click_button('Submit')

    expect(page).to have_content 'An example of a peep'
  end
end
