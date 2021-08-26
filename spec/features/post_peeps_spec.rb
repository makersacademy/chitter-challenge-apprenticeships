feature "post" do
  scenario "user wants to post peeps" do
    

    visit "peeps/new"
    fill_in('peep', with: 'this is my first peep')
    click_button("post")

    expect(page).to have_content("this is my first peep")
  end
end

