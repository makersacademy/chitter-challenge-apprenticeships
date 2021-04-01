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

  scenario 'User sees the peeps in reverse chronological order' do
    connection = PG.connect(dbname: 'chitter_test')

    Peep.create(message: 'This is a peep!', date: '2021-01-04')
    Peep.create(message: 'This is another peep!', date: '2021-02-04')
    Peep.create(message: 'This is the third peep!', date: '2021-03-04')
    Peep.create(message: 'I like cheese!', date: '2021-04-04')

    visit('/peeps')

    expect(page.find('li:nth-child(1)')).to have_content 'I like cheese!'
    expect(page.find('li:nth-child(2)')).to have_content 'This is the third peep!'
    expect(page.find('li:nth-child(3)')).to have_content 'This is another peep!'
    expect(page.find('li:nth-child(4)')).to have_content 'This is a peep!'
    
  end

end
