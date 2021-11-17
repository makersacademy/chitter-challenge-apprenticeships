feature 'view all messages' do
  scenario 'when visiting browser' do 
    
    visit('/messages/new')
    fill_in :new_post , with: 'I love Wednesdays' 

    save_and_open_page

    click_button('Submit')
  

    expect(page).to have_content 'I love Wednesdays' 
  
  end 
end 