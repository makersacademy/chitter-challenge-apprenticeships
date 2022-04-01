require 'pg'

feature 'Welcome page' do
  scenario 'user visits homepage ' do
    visit('/posts/new')
    expect(page).to have_content "Chitter App"
  end
end

feature 'Viewing posts' do
  scenario 'visiting /posts shows message ' do
    
    Post.create(date: "2022-04-01", author: "Kate", message: "How are you?")

    visit('/posts')
    expect(page).to have_content("2022-04-01")
    expect(page).to have_content("Kate")
    expect(page).to have_content("How are you?")

  end
end

feature 'Viewing posts' do
  scenario 'visiting /posts shows new messages first' do
    
    Post.create(date: "2022-04-01", author: "Kate", message: "How are you?")
    Post.create(date: "2022-06-01", author: "Kate", message: "How are you?")
    Post.create(date: "2022-08-01", author: "Kate", message: "How are you?")

    visit('/posts')
    expect(page).to have_content("2022-08-01")
    expect(page).to have_content("2022-06-01")
    expect(page).to have_content("2022-04-01")
  end
end