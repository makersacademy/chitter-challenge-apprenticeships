feature 'Adding a new peep' do
  scenario 'A user can add a peep to the feed' do
    visit('/peeps/new')
    fill_in('peep', with: 'We only allow peeps up to 60 characters!')
    click_button('Add')

    expect(page).to have_content 'We only allow peeps up to 60 characters!'
  end
end
