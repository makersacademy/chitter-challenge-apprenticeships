feature 'Views messages' do
  scenario 'user can see messages' do
    visit '/peeps'

    expect(page).to have_content("Recent Peeps")
  end

  scenario 'user views added peeps' do
    visit '/peeps'
    # Add the test data
    Peep.create(message: "Hello there!")
    Peep.create(message: "General Kenobi")
    Peep.create(message: "You are a bold one")

    visit('/peeps')

    expect(page).to have_content "Hello there!"
    expect(page).to have_content "General Kenobi"
    expect(page).to have_content "You are a bold one"
  end
end