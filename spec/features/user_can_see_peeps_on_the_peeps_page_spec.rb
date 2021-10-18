feature 'User can view peeps:' do
  scenario 'on the /peeps endpoint' do
    add_multiple_peeps_with_default_date
    visit('/peeps')
    expect(page).to have_content "This is peep1"
    expect(page).to have_content "This is peep2"
    expect(page).to have_content "This is peep3"
    expect(page).to have_content "This is peep4"
    expect(page).to have_content "This is peep5"
  end
end
