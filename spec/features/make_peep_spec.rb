feature 'Viewing home page' do
  scenario "check home page for peeps" do
    Message.make(message: "I'm a peep!")
     Message.make(message: "It is sunny!")
    Message.make(message: "I love summer!")

    visit("/home")
    expect(page).to have_content("I'm a peep!")
    expect(page).to have_content("It is sunny!")
    expect(page).to have_content("I love summer!")
  end
end
