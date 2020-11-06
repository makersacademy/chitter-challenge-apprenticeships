feature 'Deleting a peep' do
  scenario 'A user can delete a peep' do
    Peeps.add('Test delete peep')
    visit '/'
    expect(page).to have_content('Test delete peep')

    first('.peep').click_button 'Delete'

    expect(current_path).to eq '/'
    expect(page).not_to have_content('Test delete peep')
  end
end
