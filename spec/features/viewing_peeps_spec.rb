feature 'Viewing peeps' do
  scenario 'A user can view all peeps in the browser' do
    visit('/peeps')
    expect(page).to have_content "This is a peep!"
  end
end
