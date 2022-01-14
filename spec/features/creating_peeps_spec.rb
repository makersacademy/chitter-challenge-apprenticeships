feature "Add new peep" do
  scenario "A user can add new peeps" do
    visit("/new")
    fill_in('message', with: 'Hello Peeps, This is my first peep!')
    click_button('Feed the Chitter')

    expect(page).to have_content 'Hello Peeps, This is my first peep!'
  end
end