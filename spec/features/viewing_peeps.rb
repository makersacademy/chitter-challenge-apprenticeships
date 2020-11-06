require_relative 'web_helpers'

feature 'Log in' do
  scenario 'user can enter their name on the homepage and have it displayed on the front page' do
    sign_in
    expect(page).to have_content("Welcome to Chitter Jack")
  end
end

feature 'Viewing peeps' do
  scenario 'users can see all exsisting peeps on the page' do
    sign_in
    add_peep
    expect(current_path).to eq 'HomePage'
    expect(page).to have_content("This is a test peep")
    expect(page).to have_content("-")
  end
end
