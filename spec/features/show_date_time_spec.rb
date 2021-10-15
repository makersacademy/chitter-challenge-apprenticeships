feature 'Show date and time' do
  scenario 'User can see when poops were created' do
    visit('/poops')
    expect(page).to have_content('Pooped at ')
  end
end