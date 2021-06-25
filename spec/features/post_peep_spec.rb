feature 'So that a user can let people know what they are doing ' do

  scenario 'user can post a peep' do
    visit('/peeps')
    click_button('Peep!')

    expect(current_path).to eq '/peeps/new'

    fill_in(:username, with: "testUser123")
    fill_in(:message, with: "going to walk the dog")
    click_button('Peep!')

    expect(current_path).to eq '/peeps'
    expect(page).to have_content("just started my coding challenge!")
  end
end
