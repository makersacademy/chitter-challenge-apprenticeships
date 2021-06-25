feature 'So that I can find relevant peeps' do

  scenario 'user can filter by a specific keyword' do
    add_user_add_peep("testUser123", "password", "going to walk the dog")
    visit('/peeps')
    expect(page).to have_content("going to walk the dog")

    add_user_add_peep("testUser123", "password", "washing the car today")
    visit('/peeps')
    expect(page).to have_content("washing the car today")

    visit('/peeps')
    fill_in(:keyword, with: "dog")
    click_button('search')

    expect(current_path).to eq('/peeps')
    expect(page).to have_content("going to walk the dog")
    expect(page).to_not have_content("washing the car today")
  end

  scenario 'user sees a notification if there are no search results' do
    visit('/peeps')
    fill_in(:keyword, with: "dog")
    click_button('search')

    expect(current_path).to eq('/peeps')
    expect(page).to have_content("No results match that search")
  end

  scenario 'doing an empty search returns all peeps' do
    add_peep("hello, world")
    visit('/')
    expect(page).to have_content("hello, world")

    fill_in(:keyword, with: "car")
    click_button('search')
    expect(page).to_not have_content("hello, world")

    click_button('search')
    expect(page).to have_content("hello, world")
  end
end
