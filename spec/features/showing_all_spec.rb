feature "show all the messages" do
  scenario "shows all the messages" do
    ChitterMessage.post("This is a peep!")

    visit "/messages" 
    expect(page).to have_content "This is a peep!"
  end
end
