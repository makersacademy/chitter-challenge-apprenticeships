feature 'Viewing tweets' do
  scenario 'Seeing tweets on the timeline' do
    visit('/tweets')

    expect(page).to have_content "This is a tweet"
    expect(page).to have_content "This is another tweet :)"
  end
end