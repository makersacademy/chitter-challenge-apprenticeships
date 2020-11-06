feature 'Filtering for specific peeps' do
  scenario 'user searches for peeps with keywords and finds them' do
    visit('/peeps')
    fill_in('filter', with: 'peep')
    click_button('Search')

    expect(page).to have_content 'This is a peep!'
  end

  scenario 'user searches for peeps with keywords and finds empty page' do
    visit('/peeps')
    fill_in('filter', with: 'nothing')
    click_button('Search')

    expect(page).not_to have_content 'This is a peep!'
  end
end
