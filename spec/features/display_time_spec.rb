feature 'display time on peeps' do
  scenario 'it can display time next to peeps' do
    time = Time.new

    visit('/')
    click_link 'new post'

    fill_in('message', with: 'I hate sand.')
    click_button 'Submit'

    expect(page).to have_content (time.strftime("%d/%m/%Y"))
  end
end
