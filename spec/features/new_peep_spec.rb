feature 'new peep page' do
  scenario 'visiting the new peep page' do
    visit('/new_peep')
    expect(page).to have_content "New Peep:"
  end

  scenario 'can submit new peep' do
    visit('/new_peep')
    fill_in("new_peep_text", with: "This is a test peep!")
    click_button("submit_peep")
    expect(page).to have_content "Messages"
  end

  scenario 'can add new_peep to database' do
    visit('/new_peep')
    fill_in("new_peep_text", with: "This is a test peep!")
    click_button("submit_peep")
    expect(page).to have_content "This is a test peep!"
  end

end
