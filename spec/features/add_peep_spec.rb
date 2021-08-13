feature 'Viewing peeps' do
  scenario 'User wants to see all peeps' do
    visit('/addpost')
    save_and_open_page
    fill_in('post', with: 'Bang')
    click_button('Submit')

    expect(page).to have_content('Bang')
  end
end