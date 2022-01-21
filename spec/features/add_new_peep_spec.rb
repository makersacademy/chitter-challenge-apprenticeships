feature 'add peep (message) to chitter' do
  
  before do 
    connection = PG.connect(dbname: 'chitter_test')
  
    visit ('/')
    click_button 'Post a peep'
    visit ('/new_peep')
  end

  scenario 'can click on post peep message and redirected' do
    expect(page).to have_content('Post a peep')
  end

  scenario 'can fill in a new post and see it displayed' do
    fill_in :new_post_message, with: 'This is a new post peep!'
    click_button 'Post'
    visit ('/')
    expect(page).to have_content ('This is a new post peep!')
  end

end