feature 'View all peeps' do
  scenario 'visiting the index page' do
    visit('/view_peeps')
    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "So is this!"
    expect(page).to have_content "Also this!"
  end
end
