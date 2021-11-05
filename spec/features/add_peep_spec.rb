feature 'Peep' do
  scenario 'A user can add peeps (messages) to the board' do
    add_row_to_test_database
    visit '/messages'

    expect(page).not_to have_content('Databases are complicated :(')

    fill_in 'new_peep', with: 'Databases are complicated :('
    click_button('Peep!')

    expect(page).to have_current_path('/messages')
    expect(page).to have_content('Databases are complicated :(')
  end
end
