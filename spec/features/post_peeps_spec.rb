feature 'post peeps' do
  scenario "add peep to database to be displayd on page" do
    visit '/post'
    peep = 'This is a second peep!'
    fill_in 'peep', with: peep
    click_button 'Post'
    expect(page).to have_content(peep)
  end
end
