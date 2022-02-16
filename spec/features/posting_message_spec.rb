feature 'Posting a new message' do
  
  scenario 'A user can add a new message' do
    visit('/new')
    fill_in('message', with: 'Peep peep peep')
    click_button('Submit')

    expect(page).to have_content 'Peep peep peep'
  end

end