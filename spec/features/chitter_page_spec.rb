feature 'Viewing Chitter page' do
  scenario 'visiting the Chitter page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end
end

feature 'Viewing Chitter page' do
  scenario 'View all peeps' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end
end
