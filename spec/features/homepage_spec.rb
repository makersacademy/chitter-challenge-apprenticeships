feature 'Viewing the homepage' do
  scenario 'Can see all peeps' do
    visit ('/')
    expect(page).to have_content 'This is a peep!'
  end
end
