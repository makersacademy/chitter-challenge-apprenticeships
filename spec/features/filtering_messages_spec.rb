feature 'filtering messages' do
  scenario 'a user can filter messages by keyword' do
    Peep.add(message: 'Banana peep', date: '2022-07-15')
    Peep.add(message: 'Apple', date: '2022-07-10')
    Peep.add(message: 'Another banana peep', date: '2022-07-05')
    
    visit('/peeps/search')
    fill_in('keyword', with: 'banana')
    click_button('Search')

    expect(page).to have_content "Banana peep (2022-07-15)"
    expect(page).to have_content "Another banana peep (2022-07-05)"
  end
end
