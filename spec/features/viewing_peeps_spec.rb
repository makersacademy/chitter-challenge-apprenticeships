require "pg"

feature ".view" do
  scenario "User can view all peeps" do
    connection = PG.connect(dbname: "chitter_test")

    Peep.post(message: "Hello world!")
    Peep.post(message: "How you doin?")
    Peep.post(message: "Like a glooooove.")

    visit "/peeps"

    expect(page).to have_content "Hello world!"
    expect(page).to have_content "How you doin?"
    expect(page).to have_content "Like a glooooove."
  end
end
