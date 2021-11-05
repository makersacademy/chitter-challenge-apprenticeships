feature 'Add a new message' do
  scenario 'Add a new peep to chitter' do
    sign_in_start_peep
    fill_in('message', with: 'Hello World!')
    click_button('Send Peep')
    expect(page).to have_content 'Hello World!'
  end
end