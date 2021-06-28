feature 'Posting a peep' do
  scenario 'A user can post a peep to Chitter' do
    visit('/peep')
    fill_in('message', with: 'Example Peep')
    click_button('Submit')

    expect(page).to have_content 'Example Peep'
    expect(page).to have_content '2021-06-25'
  end
end