feature 'add messages' do
  scenario 'adds a new message' do
    visit ('/peeps/add')
    fill_in :message, with: 'PEEEEEEP!'
    click_button 'Peep!'
    expect(page).to have_content 'PEEEEEEP!'
  end
end
