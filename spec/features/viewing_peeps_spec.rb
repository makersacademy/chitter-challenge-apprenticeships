feature 'Viewing peeps' do
  scenario 'A user can see all peeps' do
    Peeps.create(message: "Today was a great day")
    Peeps.create(message: "Today was a greater day")
    Peeps.create(message: "Today was the greatest day")

    visit('/')

    expect(page).to have_content('Today was a great day')
    expect(page).to have_content('Today was a greater day')
    expect(page).to have_content('Today was the greatest day')
  end
end
