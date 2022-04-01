feature 'Filtering by keyword' do
  scenario 'User enters a keyword and a list of peeps containing keyword is shown' do
    visit '/peeps'
    fill_in 'message', with: 'Having fun here!'
    click_button 'Submit'
    fill_in 'message', with: 'Nah this is boring mate'
    click_button 'Submit'
    fill_in 'message', with: 'I think it is fun too!'
    click_button 'Submit'

    fill_in 'keyword', with: 'fun'
    click_button 'Search'

    expect(current_path).to eq '/peeps/filter'
    expect(page).to have_content 'Having fun here!'
    expect(page).to have_content 'I think it is fun too!'
    expect(page).not_to have_content 'Nah this is boring mate'
  end
end
