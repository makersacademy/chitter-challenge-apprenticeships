feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Peeps"
  end

  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    Peep.create(message: 'You are jelly to my burger. My point is, you are worthless.')
    Peep.create(message: 'Alexa, skip to Friday')
    Peep.create(message: 'You look happier')
    
    visit('/peeps')

    expect(page).to have_content 'You are jelly to my burger. My point is, you are worthless.'
    expect(page).to have_content 'Alexa, skip to Friday'
    expect(page).to have_content 'You look happier'
  end
end
