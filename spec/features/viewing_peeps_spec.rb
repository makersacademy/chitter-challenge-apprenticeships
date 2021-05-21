feature 'Viewing peeps' do
  scenario 'allows users to view all peeps' do
    Peeps.create(message: 'This is a peep!')
    visit '/chitter'

    expect(page).to have_content 'This is a peep!'

  end
end