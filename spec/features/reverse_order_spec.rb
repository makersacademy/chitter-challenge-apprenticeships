require "timecop"

feature "Reverse chronological order" do
  msg_1 = "older message"
  msg_2 = "latest message"
  curr_time = Time.new.strftime("%d %b %Y %H:%M")

  before do
    visit("/")
    fill_in(:message, with: msg_2)
    click_button "Post"

    Timecop.freeze(Time.local(2020))

    fill_in(:message, with: msg_1)
    click_button "Post"

    Timecop.return
  end

  it "display peeps in reverse chronological order" do
    expect(page).to have_content "#{msg_2}\n#{curr_time}\n#{msg_1}\n01 Jan 2020 00:00"
  end
end
