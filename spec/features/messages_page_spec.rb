feature "Message page" do
  scenario "can display stored messages" do
    visit '/'
    expect(page).to have_content "This is a peep!"
  end
end