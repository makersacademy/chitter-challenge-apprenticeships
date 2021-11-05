feature 'Posting' do
  scenario 'Post a peep to chitter' do
    connection = PG.connect(dbname: 'chitter_test')
    visit('/posting')
    fill_in :posting, with: 'Hi everyone!'
    click_button('Submit')
    expect(page).to have_content 'Hi everyone!'
  end
end