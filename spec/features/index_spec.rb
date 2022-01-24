feature 'Viewing home page' do
  scenario 'visiting the home page' do
    visit('/messageboard')
    expect(page).to have_content "This is the homepage for Chitter"
  end
end
