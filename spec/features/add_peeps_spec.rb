feature 'adding peeps' do
  scenario 'user can add peeps' do
    visit '/add_peep'
    fill_in('peep_box', with: 'This is a new peep!')
    click_button('Submit')
    expect(page).to have_content('This is a new peep!')
  end
end