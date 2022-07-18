feature 'Creating a new peep' do
  scenario 'A user can write and send new Peeps' do
    
    visit('/')
    fill_in('message', with: "This is a new Peep!")
    click_button('Submit')

    expect(page).to have_content "This is a new Peep!"
  end
end
