feature 'So that a user can let people know what they are doing ' do

  scenario 'user can post a peep' do
    add_user_add_peep("testUser123", "password", "going to walk the dog")

    visit('/peeps')
    expect(page).to have_content("going to walk the dog")
  end

  scenario 'user can post only when logged in' do
    visit('/peeps')
    click_button('Peep!')
    expect(current_path).to eq '/users/new'
    expect(page).to_not have_button('Peep!')

    register_user("test_user", "password")
    visit('/peeps')
    click_button('Peep!')
    expect(current_path).to eq '/peeps/new'
    expect(page).to have_button('Peep!')

    fill_in(:message, with: "hello, world!")
    click_button('Peep!')
    expect(page).to have_content("hello, world!")
  end
end
