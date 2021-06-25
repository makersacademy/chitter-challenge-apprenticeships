feature 'Writing peeps' do
  scenario 'Writing peeps' do
    visit('/peeps')
    fill_in :message, with: 'This is a test peep'
    click_button 'Submit'
    expect(page).to have_content "This is a test peep"
  end
end
