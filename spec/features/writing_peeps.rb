feature 'Writing peeps' do
  scenario 'I can write a peep' do
    visit '/'
    fill_in :message, with: 'Fabiha woz ere'
    click_button 'Submit'
    expect(page).to have_content('Fabiha woz ere')
  end
end
