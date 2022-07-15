feature 'Adding a new peep' do
  scenario 'A user can add a post to Chitter' do
    visit('/posts/new')
    time_when_posted = "2022-07-15 19:05:11"
    fill_in('peep', with: 'I added this peep from the webpage with the test!')
    click_button('Submit')
    expect(page).to have_content 'I added this peep from the webpage with the test!'
  end
end