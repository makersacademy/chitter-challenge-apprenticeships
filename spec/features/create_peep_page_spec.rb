feature 'Posts new message' do
  scenario 'Creates a new post to messages page' do
    visit '/peeps/new'
    fill_in('peep', with: "G'day all!")
    click_button('Submit')

    expect(page).to have_content("G'day all!")
  end
end
