feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    Peeps.create(message: "This is a peep!")
    Peeps.create(message: "This is not Twitter btw.")
    Peeps.create(message: "Jack Dorsey would be proud of this.")
    

    visit('/peeps')

    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "This is not Twitter btw."
    expect(page).to have_content "Jack Dorsey would be proud of this."
  end
end