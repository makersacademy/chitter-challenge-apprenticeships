feature 'Viewing test page' do
  scenario 'visiting the test page' do
    visit('/chitter')
    expect(page).to have_content "Hey there it's Friday"
  end
end
