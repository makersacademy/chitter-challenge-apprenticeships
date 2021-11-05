def sign_in
  visit('/')
  fill_in('user_name', with: 'Scott')
  click_button('Add Peep')
end