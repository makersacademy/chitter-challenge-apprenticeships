feature 'posting a new peep' do
  scenario 'user can add a new peep to Chitter' do 
    visit('/peeps/new')
    fill_in('message', with: 'Happy Thursday everyone!!')
    click_button('Submit')

    expect(page).to have_content 'Happy Thursday everyone!!'
  end
end