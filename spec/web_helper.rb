def enter_peep(text_input)
  visit('/peep')
  fill_in("message", with: text_input)
  click_on('Submit')
end
