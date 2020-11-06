feature 'FEATURE: maker can view all peeps' do
  scenario 'maker goes to /peeps' do
    visit('/peeps')
    expect(page).to have_content "This is a peep!"
  end
end
