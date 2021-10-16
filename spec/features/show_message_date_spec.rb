feature 'Message Date' do
  scenario 'user sees the message date' do
    visit '/messages'
    fill_in('new_message', with: "This is a new peep with time")
    click_button 'Post'

    expect(page).to have_content Date.today
  end
end