feature 'visting the homepage' do
  scenario 'visiting the home page' do
    visit('/')
    expect(page).to have_content "Welcome to chitter! Click Chittery doo-dah to get started!!"
  end
end
