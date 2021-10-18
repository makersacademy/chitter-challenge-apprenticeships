feature 'User can view peeps:' do
  scenario 'on the /peeps endpoint' do
    add_multiple_peeps_with_default_date
    add_peep_for_filter
    visit('/peeps')
    fill_in 'peep-filter', with: "custom peep"
    click_button :filter
    expect(page).to_not have_content "This is peep1"
    expect(page).to_not have_content "This is peep2"
    expect(page).to_not have_content "This is peep3"
    expect(page).to_not have_content "This is peep4"
    expect(page).to_not have_content "This is peep5"
    expect(page).to have_content "custom peep"
  end

  scenario 'users can revert back to the full list' do
    add_multiple_peeps_with_default_date
    add_peep_for_filter
    visit('/peeps')
    fill_in 'peep-filter', with: "custom peep"
    click_button :filter
    click_button :reset
    expect(page).to have_content "This is peep1"
    expect(page).to have_content "This is peep2"
    expect(page).to have_content "This is peep3"
    expect(page).to have_content "This is peep4"
    expect(page).to have_content "This is peep5"
    expect(page).to have_content "custom peep"
  end
end
