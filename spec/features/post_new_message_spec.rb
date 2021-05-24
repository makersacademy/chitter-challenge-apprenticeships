feature 'Post a new peep' do
  scenario 'post and display new message' do
    visit('/new')

    fill_in('message', with: 'I am a cute little pony')
    click_button('Submit')

    expect(page).to have_content 'I am a cute little pony'
  end
end

# elabprate further and make a user end way to get to /new: link
