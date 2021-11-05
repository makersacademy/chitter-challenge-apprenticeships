feature 'Show peep date' do
  scenario 'A user can see, when a peep was added' do
    visit '/messages'
    peep = 'Databases are really hard!'
    add_peep(peep, Time.local(2021, 11, 5, 10, 5, 8))
    expect(page).to have_current_path('/messages')
    expect(page).to have_content('Databases are really hard!')
    expect(page).to have_content('2021-11-05 10:05:08')
  end
end
