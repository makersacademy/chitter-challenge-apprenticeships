feature 'post peep' do
  scenario 'can send a peep to the database via browser' do
    enter_peep("May it be a light to you in dark places, when all other lights go out.")

    expect(page).to have_content "May it be a light to you in dark places, when all other lights go out."
  end
end
