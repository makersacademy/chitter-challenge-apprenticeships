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

#  As a Maker
#  So that I can easily see the latest peeps
#  I want to see a list of peeps in reverse chronological order

# feature 'order peeps chronologically' do
#   scenario 'view peeps in reverse chronilogical order'
#   Peeps.create(message: "Yesterday you said tomorrow. Just do it")
#     Peeps.create(message: "It always seems impossible until it is done")
    
#     visit('/peeps')
# end
