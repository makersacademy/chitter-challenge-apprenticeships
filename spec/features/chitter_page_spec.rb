feature 'Viewing test page' do
  scenario 'visiting the test page' do
    visit('/Chitter')
    expect(page).to have_content "This is my first post!"
  end
end
