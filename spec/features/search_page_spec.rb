feature 'Search' do
  scenario 'user enters a word they want to find in messages' do
    connection = PG.connect(dbname: 'chitter_test')

    Peep.create(message: "Crazy message here", date: '01/11/20')
    Peep.create(message: "Crazy message there", date: '01/11/20')
    Peep.create(message: "Crazy message everywhere", date: '01/11/20')

    visit('/chitter')
    fill_in('keyword', with: 'everywhere')
    click_button('Search by keyword')

    expect(page).to have_content 'Crazy message everywhere'
    expect(page).to have_no_content 'Crazy message here'
  end
  scenario 'user enters a word that has no match in messages' do

        Peep.create(message: "Crazy message here", date: '01/11/20')
        Peep.create(message: "Crazy message there", date: '01/11/20')
        Peep.create(message: "Crazy message everywhere", date: '01/11/20')

        visit('/chitter')
        fill_in('keyword', with: 'puppy')
        click_button('Search by keyword')

        expect(page).to have_content 'Sorry. No results found. Try again.'
  end
end
