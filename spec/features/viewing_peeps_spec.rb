feature 'Peeps' do
  scenario 'view all peeps' do
    visit('/peeps')
    expect(page).to have_content 'This is a peep!'
  end
end
