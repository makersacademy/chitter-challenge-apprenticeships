# As a Maker
# So that I can see what people are doing
# I want to see all the messages (peeps)
# in a browser
feature 'viewing peeps' do
  scenario 'visiting the chitter homepage' do
    visit ('/')
    expect(page).to have_content 'Chitter homepage'
  end

  scenario 'to see all the peeps' do
    visit('/peeps')
      expect(page).to have_content 'I am a peep!'
      expect(page).to have_content 'I am another peep!'
    end
  end
