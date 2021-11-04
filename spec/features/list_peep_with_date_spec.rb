feature 'Listing all peeps page' do
  scenario 'has headers' do
    visit('/all_peeps')
    expect(page).to have_content "13Oct"
  end
end
