# As a Maker
# So that I can find relevant peeps
# I want to filter on a specific keyword

feature "filter peeps by specific keyword" do
  scenario "enter the keyword 'test' to filter results" do
    visit('/peeps')
    fill_in('keyword', with: 'test')
    click_button('Filter Results')

    expect(page).to have_content 'This is a test peep!'
    expect(page).to have_content 'This is another test peep!'
    expect(page).to_not have_content 'This is an old peep'
  end
end