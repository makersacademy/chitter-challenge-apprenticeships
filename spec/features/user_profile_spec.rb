feature 'Users have profiles' do
  let(:username) { double(:username) }
  let(:password) { double(:password) }
  let(:connection) { PG.connect(dbname: 'chitter_test' )}

  scenario 'a user can see their own peeps on their profile', :focus do
    add_user_add_peep("user1", password, "message 1")
    add_user_add_peep("user2", password, "message 2")
    add_user_add_peep("user3", password, "message 3")

    add_peep("user2", "this is my second message 2")

    log_in_user("user2", password)
    click_link("My Profile")

    expect(current_path).to eq '/users/:user2'
    expect(page).to have_content "message 2"
    expect(page).to have_content "this is my second message 2"
    expect(page).to_not have_content "message 1"
    expect(page).to_not have_content "message 3"
  end
end
