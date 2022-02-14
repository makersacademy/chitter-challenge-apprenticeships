require 'time'

feature 'Posting a new message and date' do
  scenario 'A user can post a message and date to ChitterMessage' do
    timestamp = Time.now().to_s

    visit('/new')
    fill_in('message', with: 'hellohello')
    fill_in('messagedate', with: timestamp)
    click_button('Submit')

    expect(page).to have_content("hellohello #{timestamp}")
  end
end