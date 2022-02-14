feature 'Viewing messages' do
  scenario 'A user can see messages' do
    visit('/messages')

    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "This is an emergency!"
  end
end