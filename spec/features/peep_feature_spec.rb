feature 'user can fill out form for new message' do

  before :each do
    visit '/'
    click_button 'New Peep'
  end

  scenario 'page displays title' do
    expect(page).to have_content('New Peep:')
  end

  scenario 'page has message textbox' do
    expect(page).to have_field('message')
  end

  scenario 'page has submit button' do
    expect(page).to have_button('Submit')
  end
end
