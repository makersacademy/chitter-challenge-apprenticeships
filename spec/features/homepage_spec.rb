feature 'Viewing homepage' do
  scenario 'user visits homepage' do
    visit('/')
    expect(page).to have_content('Chitter')
  end

  scenario 'user sees latest peeps on homepage' do
    visit('/')
    expect(page).to have_content('This is a peep!')
  end
end