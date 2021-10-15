require "pg"

feature "viewing peeps" do
  scenario "A Maker can view peeps" do
    Peep.post(message: "I''m ordering pizza tonight no shame")
    Peep.post(message: "STOP PLAYING CHRISTMAS MUSIC IN OCTOBER!")
    Peep.post(message: "I like turtles")

    visit("/peeps")

    expect(page).to have_content "I'm ordering pizza tonight no shame"
    expect(page).to have_content "STOP PLAYING CHRISTMAS MUSIC IN OCTOBER!"
    expect(page).to have_content "I like turtles"
  end
end
