feature 'Viewing Chitter page' do

  scenario 'the user can see peeps with a date' do
    connection = PG.connect(dbname: 'chitter_test')

    ChitterManager.post(message: 'This is my first peep')
    ChitterManager.post(message: 'Fri-Yay!')
  
    visit('/')
    expect(page).to have_content "This is my first peep"
    expect(page).to have_content "Fri-Yay!"
    expect(page).to have_content 'created on 2022-02-12'
  end

  scenario 'the user can add a peep' do
    visit('/')
    fill_in('message', with: "This is my first peep")
    click_button('Post')

    expect(page).to have_content "This is my first peep"

  end

  scenario 'the peep has a created on date' do
    visit('/')
    fill_in('message', with: "This is my second peep")
    click_button('Post')

    expect(page).to have_content("This is my second peep")
    expect(page).to have_content 'created on 2022-02-12'
  end

end
