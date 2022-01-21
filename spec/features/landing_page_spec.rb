feature 'landing page' do
  scenario '-it displays the posts on a landing page' do
    visit('/')
    expect(page).to have_content('Chitter')
    expect(page).to have_content('This is a peep!')
  end

end