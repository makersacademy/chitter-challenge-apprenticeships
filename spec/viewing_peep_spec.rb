feature 'Viewing peeps' do
  scenario 'visiting the home page' do
    visit('/')
    expect(page).to have_content "chitter peeps"
  end
end

feature 'Viewing peeps' do
  scenario 'A user can see posted peeps' do
    visit('/peeps')

    expect(page).to have_content "This is a peep!"
  end
end