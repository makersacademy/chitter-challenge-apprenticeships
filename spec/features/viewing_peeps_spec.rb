feature 'Viewing peeps' do
  scenario 'A user can see the peeps' do
    visit('/messages')

    expect(page).to have_content "This is a peep!"
    # expect(page).to have_content "This is another peep!"
  end
end