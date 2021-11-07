require 'spec_helper'

feature 'Adding a peep with page: ' do
  
  scenario 'can add a new peep' do
    visit('/chitter')
    click_button('Write peep!')
    fill_in 'peep_text', with: "Another test peep"
    click_button('Peep!')
    expect(page).to have_content "Another test peep"
  
  end

  scenario 'new peeps show a date' do
    visit('/chitter')
    click_button('Write peep!')
    fill_in 'peep_text', with: "Another test peep"
    click_button('Peep!')
    expect(page).to have_content "#{Time.now.year}-#{Time.now.month}-#{check_leading_zero(Time.now.day)}"
  end

  scenario 'new peeps show in descending date order' do
    visit('/chitter')
    click_button('Write peep!')
    fill_in 'peep_text', with: "Another test peep"
    click_button('Peep!')
    expect(page).to have_content "#{Time.now.year}-#{Time.now.month}-#{check_leading_zero(Time.now.day)}"
  end


end
