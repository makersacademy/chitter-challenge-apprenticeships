require 'pg'

feature 'Viewing messages' do
  scenario 'shows all messages' do
    Messages.create(message: 'Update - I am in Paris')
    Messages.create(message: 'Just got back from the park!')
    Messages.create(message: 'Hi Chitter.')
    
    visit ('/peeps')

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Update - I am in Paris'
    expect(page).to have_content 'Just got back from the park!'
    expect(page).to have_content 'Hi Chitter.'
  end
end
