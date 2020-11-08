require '/Users/ok/Projects/individual-challenges/chitter-challenge-apprenticeships/app.rb'
require 'time'

feature 'home page' do
  scenario 'show list of peeps' do
    visit '/'
    expect(page).to have_content('I just bought a cabbage - 15:37')
    expect(page).to have_content('Eggs are so weird am I right? - 15:37')
  end
  scenario 'add a peep' do
    visit '/'
    expect(page).not_to have_content('Office UK what even is that???????')
    fill_in 'message', with: 'Office UK what even is that???????'
    click_on('Post')
    expect(page).to have_content("Office UK what even is that??????? - 15:37")
  end
  scenario 'search peeps' do
    setup_test_database
    visit '/'
    fill_in 'message', with: 'Office UK what even is that???????'
    click_on('Post')
    fill_in 'message', with: 'I just bought a cabbage'
    click_on('Post')
    fill_in 'message', with: 'Eggs are so weird am I right?'
    click_on('Post')
    expect(page).to have_content("Office UK what even is that??????? - 15:37")
    expect(page).to have_content("I just bought a cabbage - 15:37")
    expect(page).to have_content("Eggs are so weird am I right? - 15:37")
    fill_in 'search', with: 'weird'
    click_on 'Search'
    expect(page).not_to have_content("Office UK what even is that??????? - 15:37")
    expect(page).not_to have_content("I just bought a cabbage - 15:37")
    expect(page).to have_content("Eggs are so weird am I right? - 15:37")
  end
end
