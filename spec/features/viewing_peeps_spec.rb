feature 'Viewing peeps' do
  scenario 'allows users to view all peeps' do
    Peeps.create(message: 'This is a peep!')
    visit '/chitter'

    expect(page).to have_content 'This is a peep!'
  end
  
  scenario 'allows users to see date and time when peep was posted' do
    peep = Peeps.create(message: 'This is a peep!')
    visit '/chitter'

    expect(page).to have_content "#{peep.datetime}"
  end
end