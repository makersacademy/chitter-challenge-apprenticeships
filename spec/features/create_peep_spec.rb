feature 'post peep' do
  scenario 'can send a peep to database' do
    Message.create("This is the first message")
    Message.create("This is the second message")

    visit('/')

    expect(page).to have_content "This is the first message"
    expect(page).to have_content "This is the second message"
  end

  scenario 'can send a peep to the database via browser' do

    visit('/peep')
    fill_in "message", with: "May it be a light to you in dark places, when all other lights go out."
    click_on('Submit')

    expect(page).to have_content "May it be a light to you in dark places, when all other lights go out."
  end
end
