feature 'Posting a peep' do
  scenario 'A user can post a peep to Chitter' do
    visit('/peep')
    fill_in('message', with: 'Example Peep')
    click_button('Sumbit')

    expect(page).to have_content 'Example Peep'
  end
end