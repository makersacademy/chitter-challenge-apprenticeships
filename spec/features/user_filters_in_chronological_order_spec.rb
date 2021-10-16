feature 'User can view peeps in chronological order:' do
  scenario 'on the /peeps endpoint' do
    add_multiple_peeps_with_default_date
    visit('/peeps')
    click_button("old-new")
    click_button("new-old")
    click_button("old-new")
  end
end
