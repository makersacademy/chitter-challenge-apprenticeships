require 'pg'

feature Chitter do

  scenario 'to see all the messages (peeps)' do
    Peeps.create(message: 'This is a peep!')
    Peeps.create(message: 'Summer is not here yet')
    Peeps.create(message: 'ToYoda is the coolest')
    

    visit '/peeps'

    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "Summer is not here yet"
    expect(page).to have_content "ToYoda is the coolest"
  end

  scenario 'to post a  new message (peep)' do
    visit('/peeps/new')
    fill_in('message', with: 'Hangover Sunday')
    click_button('Peep')

    expect(page).to have_content "Hangover Sunday"
    expect(page).to have_content "2021-06-27"
  end

end