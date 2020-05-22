
feature 'find my keyword' do
  scenario 'it finds peeps that contain a keyword' do
    Peeps.create(message: 'Lets Party')
    Peeps.create(message: 'Lets be with somebody')
    Peeps.create(message: 'I wanna dance with somebody')
    visit('/find')
    fill_in('keyword', with: 'somebody')
    click_button 'Find'
    expect(page).to have_content 'I wanna dance with somebody'
  end
end