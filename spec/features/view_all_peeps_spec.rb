feature "viewing all messages (peeps)" do

  # As a Maker
  # So that I can see what people are doing
  # I want to see all the messages (peeps) in a browser

  scenario "view all peeps" do
    visit('/peeps')

    expect(page).to have_content("This is a test peep!")
    expect(page).to have_content("This is another test peep!")
    expect(page).to have_content("This is an old peep")
  end

  # As a Maker
  # So that I can see when people are doing things
  # I want to see the date the message was posted

  scenario "view the date the message was posted" do
    visit('/peeps')
    today_date = Time.now.strftime("%Y-%m-%d")

    expect(page).to have_content("#{today_date}: This is a test peep!")
    expect(page).to have_content("2022-01-01: This is another test peep!")
    expect(page).to have_content("2021-01-01: This is an old peep")
  end

  # As a Maker
  # So that I can easily see the latest peeps
  # I want to see a list of peeps in reverse chronological order

  scenario "view messages in chronological order" do
    visit('/peeps')
    today_date = Time.now.strftime("%Y-%m-%d")
    expect(page).to have_content("#{today_date}: This is a test peep! 2022-01-01: This is another test peep! 2021-01-01: This is an old peep")
  end
    
end
