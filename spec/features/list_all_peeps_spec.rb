feature 'Listing all peeps page' do
  scenario 'has headers' do
    r = double('test', :list => %w[a b])
    visit('/all_peeps')
    expect(page).to have_content "Peep"
  end
  scenario 'lists all peeps' do
    visit('/all_peeps')
    expect(page).to have_content "This is a peep!"
  end
end

