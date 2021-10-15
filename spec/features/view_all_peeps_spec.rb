feature 'View all peeps (messages): ' do

  scenario 'click on button to view all peeps (messages)' do
    visit '/'
    expect(page).to have_button('View peeps')
  end
  
  scenario 'peeps (messages) are displayed' do
    visit '/'
    click_button 'View peeps'
    expect(page).to have_content("Hello, this is a new peep!")
  end

end
