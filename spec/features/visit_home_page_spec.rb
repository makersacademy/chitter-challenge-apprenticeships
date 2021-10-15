feature 'Visit home page: ' do
  scenario 'can visit the home page and see the title Chitter' do
    visit('/')
    expect(page).to have_content("Chitter")
  end
end
