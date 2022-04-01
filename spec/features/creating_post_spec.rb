feature 'Adding a new post' do
  scenario 'a user can add a new post' do
    visit('/posts/new')
    fill_in("date", with: "2022-04-01")
    fill_in("author", with: "Rose")
    fill_in("message", with: "How are you?")
    click_button('Submit')

    expect(page).to have_content("How are you?")
  end
end
feature 'Adding a new post' do
  scenario 'a user can add a new post' do
    visit('/posts/new')
    fill_in("date", with: "2022-04-01")
    fill_in("author", with: "Rose")
    fill_in("message", with: "How are you?")
    click_button('Submit')

    expect(page).to have_content("Rose")
  end
end
feature 'Adding a new post' do
  scenario 'a user can add a new post' do
    visit('/posts/new')
    fill_in("date", with: "2022-04-01")
    fill_in("author", with: "Rose")
    fill_in("message", with: "How are you?")
    click_button('Submit')

    expect(page).to have_content("2022-04-01")
  end
end
