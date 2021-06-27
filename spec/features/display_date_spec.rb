feature "Displaying date" do
  msg = "This is test peep!"

  it "peep shows date and time of creation" do
    visit "/"
    fill_in(:message, with: msg)
    click_button "Post"
    expect(page).to have_content "#{msg}\n#{Time.new.strftime("%d %b %Y %H:%M")}"
  end
end
