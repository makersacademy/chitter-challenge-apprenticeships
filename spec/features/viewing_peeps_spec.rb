feature 'Viewing peeps' do
  scenario 'user can view all peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    Peeps.create(message: 'Test peep!')
    Peeps.create(message: 'Second test peep!')

    visit ('/peeps')

    expect(page).to have_content('Test peep!')
    expect(page).to have_content('Second test peep!')
  end
end