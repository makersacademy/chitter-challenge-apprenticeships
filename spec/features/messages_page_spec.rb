feature "Message page" do
  scenario "can display stored messages" do
    visit '/'
    expect(page).to have_content "This is a peep!"
  end
  scenario "can revere message order" do
    visit '/'
    click_link("Sort by old.")
    expect(page).to have_content "Messages:"
  end
  scenario "can filter entries" do
    visit '/'
    fill_in("find", with: "peep")
    click_button('submit')
    expect(page).not_to have_content "test"
  end
end