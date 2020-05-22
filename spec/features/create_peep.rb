require 'setup_test_database'
feature 'Adding a new peep' do
  scenario 'visiting /messages/new and adding a peep' do
    visit('/messages/new')
    fill_in('Peep', with: 'This is another peep!')
    click_button('Peep!')
   expect(page).to have_content 'This is another peep!'
  end
end

