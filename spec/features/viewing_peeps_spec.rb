require 'pg'
require 'date'
feature 'Viewing peeps' do
  scenario 'A user can see messages (peeps)' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    Peep.create(message:'This is a Peep')
    Peep.create(message:'And I Oop!')
    Peep.create(message:'Everybody in love, put your hands up! #JLSReunionTour')

    visit('/chitter-feed')

    expect(page).to have_content('This is a Peep')
    expect(page).to have_content('And I Oop!')
    expect(page).to have_content('Everybody in love, put your hands up! #JLSReunionTour')
    expect(page).to have_content(Date.today)



  end
end