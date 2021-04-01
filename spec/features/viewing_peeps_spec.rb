require 'pg'

feature 'viewing index page' do
  scenario 'User can see the index page' do
    visit('/')
    expect(page).to have_content "Peeps!"
  end
end

feature 'viewing peeps' do
  scenario 'User can see the peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    peep_date = Time.new.strftime("%Y-%d-%m")
    Peep.create(message: 'This is a peep!', date: peep_date)
    
    visit('/peeps')

    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "2021-01-04"
  end
end
