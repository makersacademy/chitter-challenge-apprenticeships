feature 'Adding a new peep' do
  scenario 'A user can post a new peep to Chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'I am getting to grips with coding.')
    fill_in('date', with: '21/05/20')
    click_button('Peep')

    save_and_open_page

    expect(page).to have_link('21/05/20', href: 'I am getting to grips with coding.')
  end
end
