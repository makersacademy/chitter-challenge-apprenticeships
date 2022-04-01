feature 'Peeps show date posted' do
  scenario 'User posts a peep and the date is shown' do
    visit '/peeps'

    fill_in 'message', with: 'My first peep!'
    click_button 'Submit'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Posted on: #{Date.today}"
  end
end