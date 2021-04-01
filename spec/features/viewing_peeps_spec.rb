feature 'viewing index page' do
  scenario 'User can see the index page' do
    visit('/')
    expect(page).to have_content "Peeps!"
  end
end

feature 'viewing peeps' do
  scenario 'User can see the peeps' do
    visit('/peeps')

    expect(page).to have_content "This is a peep!"
  end
end
