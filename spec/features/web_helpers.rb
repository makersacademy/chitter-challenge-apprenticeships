def add_peep(username, message)
  visit '/peeps'
  fill_in 'peep_user', with: username
  fill_in 'peep_message', with: message
  click_button 'Send'
end
