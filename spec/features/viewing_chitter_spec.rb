feature 'Viewing chitter page' do
  
  scenario 'visiting the chiter page' do
    visit('/chitter')
    expect(page).to have_content "Chitter"
  end
  scenario 'seeing a peep' do
    visit('/chitter')
    expect(page).to have_content "This is a peep!"
  end

end
