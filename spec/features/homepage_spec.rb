feature 'Viewing the homepage' do
  scenario 'Can see all peeps' do
    visit ('/')
    save_and_open_page
    expect(page).to have_content 'This is a peep!'
  end
end
