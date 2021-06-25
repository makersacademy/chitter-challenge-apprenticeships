feature 'Updating a peep' do
  scenario 'A user can update a peep' do
    peep = Peeps.add('This is an old peep')
    visit '/'
    expect(page).to have_content('This is an old peep')

    first('.peep').click_button 'Edit'
    expect(current_path).to eq "/#{peep.id}/edit"

    fill_in('message', with: "This is a new peep")
    click_button('Submit')

    expect(current_path).to eq '/'
    expect(page).not_to have_content('This is an old peep')
    expect(page).to have_content('This is a new peep')
  end
end
