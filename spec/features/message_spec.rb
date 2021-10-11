feature 'Messages' do
  scenario 'show messages' do
    visit('/messages')
    expect(page).to have_content "Today's first peep"
  end
end