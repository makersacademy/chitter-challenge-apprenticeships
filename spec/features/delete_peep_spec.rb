feature 'delete a peep from the peeps page' do
  scenario 'when delete button is clicked, the peep should be deleted' do
    Peeps.add(message: 'Test peep 209')
    visit('/peeps')

    expect(page).to have_content('Test peep 209')
    first('.peep').click_button('Delete')

    expect(current_path).to eq('/peeps')
    expect(page).to_not have_content('Test peep 209')

  end
end