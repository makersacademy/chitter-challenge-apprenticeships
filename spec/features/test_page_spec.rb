feature 'Viewing welcome page' do
  scenario 'visiting the welcome page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter! It's like Twitter, but with Ch :P"
  end
end
