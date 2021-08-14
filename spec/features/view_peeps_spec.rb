feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/home')

    expect(page).to have_content "This is a peep!"
  end
end