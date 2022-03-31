feature 'Welcome page' do
  scenario 'user visits homepage ' do
    visit('/')
    expect(page).to have_content "Chitter App"
  end
end

feature 'Viewing posts' do
  scenario 'user can see posts' do
    visit('/posts')
    expect(page).to have_content "Best day of my life"
    expect(page).to have_content "Tennis related news"
    expect(page).to have_content "Grateful"
  end
end
