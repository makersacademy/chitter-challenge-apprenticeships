feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/peeps')

    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "This is not Twitter btw."
    expect(page).to have_content "Jack Dorsey would be proud of this."
  end
end