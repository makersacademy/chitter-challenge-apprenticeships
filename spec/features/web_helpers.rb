def sign_up
  visit('/sign_up')
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'testpassword987')
  click_button('Submit')
end

def add_peep
  click_button 'Submit Peep'
  fill_in('message', with: 'This is a new Peep!')
end
