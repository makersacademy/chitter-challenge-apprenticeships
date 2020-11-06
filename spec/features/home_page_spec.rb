require '/Users/ok/Projects/individual-challenges/chitter-challenge-apprenticeships/app.rb'

feature 'home page' do
  scenario 'show list of peeps' do
    visit '/'
    expect(page).to have_content('I just bought a cabbage')
    expect(page).to have_content('Eggs are so weird am I right?')
  end
  scenario 'add a peep' do
    visit '/'
    expect(page).not_to have_content('Office UK what even is that???????')
    fill_in 'message', with: 'Office UK what even is that???????'
    click_on('Post')
    expect(page).to have_content('Office UK what even is that???????')
  end
end
