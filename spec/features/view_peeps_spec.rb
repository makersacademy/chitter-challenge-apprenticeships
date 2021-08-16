require_relative '../../app.rb'

feature 'Peeps are displayed on the page' do
  scenario 'users can see peeps' do
    visit ('/')
    expect(page).to have_content('This is a peep!')
  end
end