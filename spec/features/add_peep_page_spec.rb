require_relative '../../lib/date.rb'

feature 'viewing the add peeps page' do
  scenario 'takes you to the page with the form' do
    visit('/peeps/new')
    expect(page).to have_content('Post a peep')
  end

  scenario 'submitting the form creates a new peep' do
    visit('/peeps/new')
    fill_in('message', with: 'This is my first peep!')
    click_button('Submit')

    expect(page).to have_content('This is my first peep!')
    expect(page).to have_content(give_date)
  end  
end