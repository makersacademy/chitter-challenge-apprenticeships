require 'date'

feature 'Post has a date' do
  scenario 'Fill in form and expect peep and date' do
    visit('/home')
     fill_in('message', with: "Winter is cold!")
    click_button('Post')
    
    date = Date.today 
    expect(page).to have_content("Winter is cold! Date posted: #{date}")
  end
end
  