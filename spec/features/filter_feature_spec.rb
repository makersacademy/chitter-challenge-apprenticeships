feature 'user can fill out form for filtering' do
  before :each do
    visit '/'
    click_button 'Filter'
  end

  scenario 'page displays title' do
    expect(page).to have_content('Enter keyword:')
  end

  scenario 'page has keyword textbox' do
    expect(page).to have_field('keyword')
  end

  scenario 'page has submit button' do
    expect(page).to have_button('Submit')
  end
end

feature 'user can view filtered peeps' do

  before(:each) do
    visit '/'
    click_on 'New Peep'
    fill_in "message", with: 'Test peep one'
    click_button 'Submit'

    click_on 'New Peep'
    fill_in "message", with: 'Test peep two'
    click_button 'Submit'

    click_button 'Filter'
    fill_in "keyword", with: 'one'
    click_button 'Submit'
  end

  scenario 'peeps containing keyword are displayed to the screen' do
    expect(page).to have_content("Test peep one")
  end

  scenario 'peeps not containing keyword are not displayed to the screen' do
    expect(page).not_to have_content("Test peep two")
  end

  scenario 'user can return to homepage with all peeps unfiltered' do
    click_button 'Back'
    expect(page).to have_content("Test peep two")
  end
end
