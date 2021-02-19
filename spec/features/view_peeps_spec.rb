# As a Maker
# So that I can see what people are doing
# I want to see all the messages (peeps) in a browser

feature 'view peeps' do
  scenario 'view all peeps in a browser' do
    Peeps.create(message: "Yesterday you said tomorrow. Just do it")
    Peeps.create(message: "It always seems impossible until it is done")
    
    visit('/peeps')
    expect(page).to have_content("Yesterday you said tomorrow. Just do it")
    expect(page).to have_content("It always seems impossible until it is done")
  end
end
