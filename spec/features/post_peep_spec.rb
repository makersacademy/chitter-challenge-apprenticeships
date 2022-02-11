feature 'Posting a peep' do

  scenario 'A user can post a peep on Chitter' do
    visit('/new')
    fill_in('message', with: 'Oh, dress yourself, my urchin one')
    click_button('Post your Peep!')

    expect(page).to have_content 'Oh, dress yourself, my urchin one'
  end

end
