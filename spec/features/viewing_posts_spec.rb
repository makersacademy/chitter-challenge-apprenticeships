feature 'Viewing posts' do
  scenario 'A user can see posts' do
    visit('/posts')
    expect(page).to have_content "This is my first post!"
  end
end