feature 'Viewing all messages' do
  scenario 'seeing all the peeps' do
    visit('/all_messages')
    expect(page).to have_content 'Here are all your peeps!'
  end
end
