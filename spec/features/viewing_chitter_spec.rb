require 'pg'

feature 'Viewing Peeps' do

  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end

  scenario 'A user can see all the peeps' do

    Peep.create(message: "Peep 1", date: '2021-06-25')
    Peep.create(message: "Peep 2", date: '2021-06-25')
    Peep.create(message: "Peep 3", date: '2021-06-25')
      
    visit('/chitter')

    expect(page).to have_content("Peep 1") 
    expect(page).to have_content('2021-06-25')
    expect(page).to have_content("Peep 2") 
    expect(page).to have_content('2021-06-25')
    expect(page).to have_content("Peep 3") 
    expect(page).to have_content('2021-06-25')
  end
end
