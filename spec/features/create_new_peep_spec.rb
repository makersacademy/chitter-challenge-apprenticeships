# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature "post a message (peep) to chitter" do
  scenario "create a new peep" do
    visit('/peeps/new')
    fill_in('peep', with: 'I created a new test peep!')
    click_button('Submit')

    expect(page).to have_content('I created a new test peep!')
  end
end
