feature 'User can view peeps:' do
  scenario 'on the /peeps endpoint' do
    add_two_peeps_from_different_days
    visit('/peeps')
    click_button("old-new")
  end
end
