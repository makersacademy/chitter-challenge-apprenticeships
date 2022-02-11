feature 'user can create a peep' do
  scenario 'posts a comment' do
    conn = PG.connect(dbname: 'chitter_test')

    visit("/")

    fill_in :message, with: 'Can you hear me?'
    click_button 'Comment'

    expect(page).to have_content 'Can you hear me?'
  end
end