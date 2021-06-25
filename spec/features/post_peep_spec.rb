feature "Posting Peeps" do
  msg = "This is test peep!"
  scenario "user can post a peep" do
    visit("/")
    expect(page).to have_content "Chitter Chatter"
    fill_in(:message, with: msg)
    click_button "Post"
    expect(current_path).to eq "/"
    expect(page).to have_content msg
  end
end
