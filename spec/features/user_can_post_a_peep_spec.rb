feature 'User can view peeps:' do
  scenario 'on the /peeps endpoint' do
    visit('/peeps')
    click_button("add-peep-button")
    expect(page).to have_current_path "/new-peep"
    fill_in 'peep-text', with: "This is my peep!"
    click_button("post-button")
    expect(page).to have_current_path "/peeps"
    expect(page).to have_content "This is my peep!"
  end
end
