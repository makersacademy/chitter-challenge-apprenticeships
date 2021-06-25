feature 'So that I can find relevant peeps' do

  scenario 'user can filter by a specific keyword' do
    visit('/peeps')
    click_button('Peep!')
    fill_in(:username, with: "testUser123")
    fill_in(:message, with: "going to walk the dog")
    click_button('Peep!')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content("going to walk the dog")

    click_button('Peep!')
    fill_in(:username, with: "testUser456")
    fill_in(:message, with: "washing the car today")
    click_button('Peep!')
    expect(current_path).to eq '/peeps'
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
end
