feature 'it adds a post to the messageboard' do 
  scenario 'clicks on the add button and enters a message' do 
    visit('/messageboard')
    click_button('Add')
    fill_in 'message', with: 'This is a test peep' 
    click_button('Submit')

    expect(current_path).to eq '/messageboard'
    expect(page).to have_content 'This is a test peep'
  end 
end