feature 'viewing peeps' do
  scenario 'the user can view peeps on the homepage' do
    db = PG.connect(dbname: 'chitter_test')

    db.exec("INSERT INTO peeps (message) VALUES ('This is another peep!')")

    visit('/')
    expect(page).to have_content "This is a peep!"
  end
end
