feature 'Filtering peeps' do
  scenario 'Filtering peeps' do
    visit('/peeps')
    fill_in :message, with: 'This is a test peep'
    click_button 'Submit'
    fill_in :message, with: 'Hello World'
    click_button 'Submit'
    fill_in :filter, with: 'Hello'
    click_button 'Filter'
    expect(page).to have_no_content "This is a test peep"
  end
end
