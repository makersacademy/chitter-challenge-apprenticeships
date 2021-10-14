feature 'Viewing homepage: ' do
  scenario 'visiting the homepage' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
    expect(page).to have_link('Messages')
  end
end
