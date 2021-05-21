feature 'posting a new peep' do
  scenario 'publishing a new peep' do
    visit('/newpeep')

    fill_in "peep", with: "test peep"
    click_button "Post dat Peep, baby!"

    expect(page).to have_content('test peep')
    expect(page).to have_content("2021-05-21")
  end
end
