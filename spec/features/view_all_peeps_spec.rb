# As a Maker
# So that I can see what people are doing
# I want to see all the messages (peeps) in a browser

# As a Maker
# So that I can see when people are doing things
# I want to see the date the message was posted

feature "viewing all messages (peeps)" do
  scenario "view all peeps" do
    visit('/peeps')

    expect(page).to have_content("This is a test peep!")
    expect(page).to have_content("This is another test peep!")
  end

  scenario "view the date the message was posted" do
    visit('/peeps')
    today_date = Time.now.strftime("%Y-%m-%d")

    expect(page).to have_content("#{today_date}: This is a test peep!")
    expect(page).to have_content("#{today_date}: This is another test peep!")
  end
end
