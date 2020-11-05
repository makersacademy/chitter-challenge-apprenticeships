feature 'user can fill out form for filtering' do
  scenario 'page displays title' do
    visit '/'
    click_button 'Filter'
    expect(page).to have_content('Enter keyword:')
  end

  scenario 'page has keyword textbox' do
    visit '/'
    click_button 'Filter'
    expect(page).to have_field('keyword')
  end

  scenario 'page has submit button' do
    visit '/'
    click_button 'Filter'
    expect(page).to have_button('Submit')
  end
end

feature 'user can view filtered peeps' do
  scenario 'peeps containing keyword are displayed to the screen' do
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

    expect(page).not_to have_content("Peeps:")
    expect(page).to have_content("Results:")
    expect(page).to have_content("Test peep one")
  end

  scenario 'user can return to homepage with all peeps unfiltered' do
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

    click_button 'Back'
    expect(page).not_to have_content("Results:")
    expect(page).to have_content("Peeps:")
  end
end
