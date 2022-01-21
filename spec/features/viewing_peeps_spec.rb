feature 'visit the index page' do
  scenario 'visiting the index page to view peeps' do
    visit('/')
    expect(page).to have_content "Chitter"
  end
end

feature 'viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/peeps')
  
    expect(page).to have_content "This is my first peep"
    expect(page).to have_content "This is my second peep"
    expect(page).to have_content "This is my third peep"
  end
end
