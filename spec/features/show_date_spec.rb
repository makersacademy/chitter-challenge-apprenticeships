feature 'include date' do
  scenario 'each peep displays the date when it was posted' do
    visit('/view_peeps')
    fill_in('message', with: 'Posted today')
    click_button('PEEP!')
    todays_date = Date.today.to_s
    expect(page).to have_content todays_date
  end
end