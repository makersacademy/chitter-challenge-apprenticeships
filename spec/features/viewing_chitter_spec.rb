require 'pg'

feature 'Viewing Peeps' do

  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end

  scenario 'A user can see all the peeps' do

    Peep.create(message: "Peep 1")
    Peep.create(message: "Peep 2")
    Peep.create(message: "Peep 3")
      
    visit('/chitter')

    expect(page).to have_content "Peep 1"
    expect(page).to have_content "Peep 2"
    expect(page).to have_content "Peep 3"
  end
end
