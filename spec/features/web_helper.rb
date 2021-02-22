def sign_in_and_submit
  visit('/')
  fill_in(:name, with: 'Barry')
  fill_in(:password, with: 'test_password')
  click_button('submit')
  click_link('Go to homepage')
end