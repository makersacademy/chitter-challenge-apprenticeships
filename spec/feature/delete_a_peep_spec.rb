feature 'Deleting a peep' do
  scenario 'A user can delete a peep' do
    ChitterModel.add_peeps(message: "This is a peep!")
    visit('/view-peeps')
    expect(page).to have_content("This is a peep!")

    first('.message').click_button 'Delete'

    expect(page).not_to have_content("This is a peep!")
  end
end
