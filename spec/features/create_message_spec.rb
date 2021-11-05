feature 'Add a new message' do
  scenario 'Add a new peep to chitter' do
    sign_in
    expect(page).to have_content 'Welcome to Chitter Scott'
  end
end