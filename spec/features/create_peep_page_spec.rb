feature 'Posts new message' do
  scenario 'Creates a new post to messages page' do
    connection = PG.connect(dbname: 'chitter_test')
    visit '/peeps/new'
    fill_in('message', with: "Gday all!")
    click_button('Submit')

    expect(page).to have_content("Gday all!")
  end
end
