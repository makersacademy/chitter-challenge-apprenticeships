def sign_in
  visit('/')
  fill_in('user_name', with: 'Scott')
  click_button('Add Peep')
  expect(page).to have_content 'Welcome to Chitter Scott'
end

def sign_in_start_peep
  visit('/')
  fill_in('user_name', with: 'Scott')
  click_button('Add Peep')
  click_button('Start a new Peep!')
end