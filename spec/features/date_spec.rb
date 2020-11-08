feature 'Viewing test page' do
  scenario 'visiting the test page' do
    connection = PG.connect(dbname: 'chitter_test')

    Peep.create(message: "Crazy message here", date: '01/11/20')
    Peep.create(message: "Crazy message there", date: '02/11/20')
    Peep.create(message: "Crazy message everywhere", date: '03/11/20')

    visit('/chitter')

    expect(page).to have_content('01/11/20')
    expect(page).to have_content('02/11/20')
    expect(page).to have_content('03/11/20')
  end
end
