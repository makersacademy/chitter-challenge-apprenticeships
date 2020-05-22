feature 'Adding a new peep' do
  scenario 'A user can post a new peep to Chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'I am getting to grips with coding.')
    click_button('Peep')

    save_and_open_page
    
    expect(page).to have_content('I am getting to grips with coding.')
  end
end
