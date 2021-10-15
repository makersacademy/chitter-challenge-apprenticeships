require "pg"

feature "Viewing peeps" do
  scenario "User can view all the messages (peeps)" do
    Peep.post(message: "This is a peep!")
    Peep.post(message: "This is another peep!")

    visit("/peeps")

    expect(page).to have_content("This is a peep!")
    expect(page).to have_content("This is another peep!")
  end
end
