feature 'Messages' do
  scenario 'show all messages' do
    visit '/messages'
    expect(page).to have_content "Today's first peep"
    expect(page).to have_content "Today's second peep"
    expect(page).to have_content "Today's third peep"
  end
end