feature 'Filter peeps' do
  scenario 'A user can filter peeps by keyword' do 
    visit 'messages'
    peep1 = 'Databases are complicated :('
    peep2 = 'They are hard to understand!'
    peep3 = 'There are so many of them!!!'
    add_peep(peep1, Time.local(2021,11,5))
    add_peep(peep2, Time.local(2021,11,6))
    add_peep(peep3, Time.local(2021,11,7))
    expect(page).to have_content(peep1)
    expect(page).to have_content(peep2)
    expect(page).to have_content(peep3)
    fill_in 'filter_keyword', with: 'Database'
    click_button('Filter')
    expect(page).to have_content(peep1)
    expect(page).not_to have_content(peep2)
    expect(page).not_to have_content(peep3)   
  end  
end
