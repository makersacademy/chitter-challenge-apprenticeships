feature 'viewing peeps' do
  scenario 'User can view previously posted peeps' do
    Peep.create(message: 'This is a peep!')

    visit '/peeps'

    expect(page).to have_content 'This is a peep!'
  end
end
