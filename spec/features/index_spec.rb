require 'pg'

feature 'Viewing messages' do
  
  scenario 'A user can see messages' do
    Peep.create(message: 'This is another peep')
    Peep.create(message: 'Peep peep peep')

    visit('/')

    expect(page).to have_content ('This is another peep')
    expect(page).to have_content ('Peep peep peep')
  end

end