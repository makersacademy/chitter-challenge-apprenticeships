feature 'Homepage' do
  scenario 'has a title on the homepage' do
    visit('/home')
    expect(page).to have_content "Chitter"
  end
end