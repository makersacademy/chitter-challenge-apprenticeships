require 'spec_helper'

feature 'Adding a peep' do
  
  scenario 'can add a peep' do
    visit('/chitter')
    click_button('Write peep!')
    fill_in 'peep_text', with: "Another test peep"
    click_button('Peep!')
    expect(page).to have_content "Another test peep"
  
  end

end
