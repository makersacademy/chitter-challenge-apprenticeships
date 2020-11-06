def submit_a_message
  visit "/Chitter"
  fill_in :peep, with: "This is my first post!"
  click_button 'Add a peep'
end
