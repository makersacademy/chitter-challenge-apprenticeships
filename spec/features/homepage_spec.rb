feature 'Viewing homepage' do
  scenario 'user visits homepage' do
    visit('/')
    expect(page).to have_content('Chitter')
  end
end