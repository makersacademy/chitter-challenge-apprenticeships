feature 'Posting a new peep' do
  scenario 'A user can post a new peep to Chitter' do
    visit('/peeps/new')
    fill_in('message', with: "Thinking of something funny to peep")
    click_button('Peep It!')

    expect(page).to have_content "Thinking of something funny to peep"
  end
end
