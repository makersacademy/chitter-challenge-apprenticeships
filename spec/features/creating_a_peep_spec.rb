feature 'Creating a peep' do
  scenario 'User submits a peep' do
    visit '/peeps'

    fill_in 'message', with: 'My first peep!'
    click_button 'Submit'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'My first peep!'
  end
end
