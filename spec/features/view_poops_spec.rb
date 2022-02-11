feature 'View poops' do
  scenario 'User can view all the poops' do
    visit('/poops')
    expect(page).to have_content('This is a poop!')
  end
end