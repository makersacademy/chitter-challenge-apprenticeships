feature 'Adding peeps' do
  scenario 'page has input field for peeps' do
    visit('/')
    expect(page).to have_field 'new_peep'
  end

  scenario 'user can post a new peep' do
    visit('/')
    fill_in :new_peep, with: 'Shiny new peep :D'
    click_button 'post'

    expect(page).to have_content 'Shiny new peep :D'
  end
end
