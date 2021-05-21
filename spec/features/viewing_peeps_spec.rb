feature 'Viewing peeps' do
  scenario 'visiting the home page' do
    connection = PG.connect(dbname: 'chitter_test')
    
    Peep.create(message: "Oh, hi doggy")
    Peep.create(message: "Cheep cheep cheep cheep")
    Peep.create(message: "Anything for my princess")

    visit('/')

    expect(page).to have_content "Welcome to Chipper"
    expect(page).to have_content "Oh, hi doggy"
    expect(page).to have_content "Cheep cheep cheep cheep"
    expect(page).to have_content "Anything for my princess"
  end
end