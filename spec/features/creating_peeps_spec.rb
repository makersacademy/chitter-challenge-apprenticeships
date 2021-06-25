feature 'Add a new peep' do
  scenario 'A user can add a peep to the peep board' do
    visit('/')
    fill_in('peeps', with: 'This is my first peep')
    click_button('Submit')

    expect(page).to have_content 'This is my first peep'
  end

  scenario 'A users name can be identified with the peep' do
    visit ('/')
    fill_in('username', with: '@Melissa')
    fill_in('peeps', with: 'Does this work?')
    click_button('Submit')

    expect(page).to have_content '@Melissa'
    expect(page).to have_content 'Does this work?'
  end

  scenario 'The date is displayed with a new peep' do
    visit ('/')
    fill_in('username', with: '@Frank')
    fill_in('peeps', with: 'Gimme a date')
    click_button('Submit')

    expect(page).to have_content 'Date posted:'
  end

end
