require 'timecop'

feature 'Show peep date' do
  before do
    test_time = Time.local(2021, 11, 5, 10, 5, 8)
    Timecop.freeze(test_time)
  end
  scenario 'A user can see, when a peep was added' do
    visit '/messages'
    fill_in 'new_peep', with: 'Databases are really hard!'
    click_button('Peep!')
    expect(page).to have_current_path('/messages')
    expect(page).to have_content('Databases are really hard!')
    expect(page).to have_content('2021-11-05 10:05:08')
  end
end
