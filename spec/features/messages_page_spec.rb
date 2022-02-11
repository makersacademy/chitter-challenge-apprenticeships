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
end
end
