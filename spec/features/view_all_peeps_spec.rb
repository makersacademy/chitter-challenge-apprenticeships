# As a Maker
# So that I can see what people are doing
# I want to see all the messages (peeps) in a browser

feature "viewing all messages (peeps)" do
  scenario "view all peeps" do
    visit('/peeps')

    expect(page).to have_content("This is a test peep!")
    expect(page).to have_content("This is another test peep!")
  end
end