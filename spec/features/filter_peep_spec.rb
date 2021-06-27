feature "Filtering Peeps" do
  msg_1 = "hello, I am new to Chitter."
  msg_2 = "Hello, how is everyone?"
  msg_3 = "Good morning folks!"

  before do
    visit("/")
    fill_in(:message, with: msg_1)
    click_button "Post"

    fill_in(:message, with: msg_2)
    click_button "Post"

    fill_in(:message, with: msg_2)
    click_button "Post"

    fill_in(:search_field, with: "hello")
    click_button "search"
  end

  scenario "user can search a keyword & filter peeps (case insensitive search)" do
    expect(current_path).to eq "/peep/matches"
    expect(page).not_to have_content msg_3
    expect(page).to have_content msg_1
    expect(page).to have_content msg_2
  end
end
