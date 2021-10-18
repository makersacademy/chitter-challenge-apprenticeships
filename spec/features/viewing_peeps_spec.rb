require "pg"

feature ".view" do
  scenario "User can view all peeps" do
    visit "/peeps"
    expect(page).to have_content "Hello world!"
    expect(page).to have_content "How you doin?"
    expect(page).to have_content "Like a glooooove."
  end
end
