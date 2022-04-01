require 'pg'

feature 'Welcome page' do
  scenario 'user visits homepage ' do
    visit('/posts/new')
    expect(page).to have_content "Chitter App"
  end
end

feature 'Viewing posts' do
  scenario 'visiting /posts shows all posts' do
    
    Post.create(author: "Rose", message: "How are you?")

    visit('/posts')
    expect(page).to have_content("Rose", "How are you?")

  end
end
