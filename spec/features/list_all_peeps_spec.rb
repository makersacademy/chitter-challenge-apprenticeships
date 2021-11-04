feature 'Listing all peeps page' do
  scenario 'listing all peeps has headers' do
    visit('/all_peeps')
    expect(page).to have_content "Peep"
  end
end

