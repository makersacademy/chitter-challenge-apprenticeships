feature 'Viewing Chitter page' do
  scenario 'the user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    ChitterManager.post(message: 'This is my first peep')
    ChitterManager.post(message: 'Fri-Yay!')
  
    visit('/chitter')
    expect(page).to have_content "This is my first peep"
    expect(page).to have_content "Fri-Yay!"
  end

  scenario 'the user can add a peep' do
    visit('/chitter')
    fill_in('message', with: "This is my first peep")
    click_button('Post')

    expect(page).to have_content "This is my first peep"

  end

end
