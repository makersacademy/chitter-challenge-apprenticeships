feature 'Viewing peeps' do
  scenario 'visiting the home page' do
    connection = PG.connect(dbname: 'chitter_test')
    
    Peep.create(message: "Oh, hi doggy", date: "2021-05-19")
    Peep.create(message: "Cheep cheep cheep cheep", date: "2021-03-20")
    Peep.create(message: "Anything for my princess", date: "2021-05-15")

    visit('/')

    expect(page).to have_content "Welcome to Chipper"
    expect(page).to have_content "Oh, hi doggy"
    expect(page).to have_content "2021-05-19"
    expect(page).to have_content "Cheep cheep cheep cheep"
    expect(page).to have_content "2021-03-20"
    expect(page).to have_content "Anything for my princess"
    expect(page).to have_content "2021-05-15"
  end
end