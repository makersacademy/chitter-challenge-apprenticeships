feature "post message" do 
  scenario 'users can post message to chitter ' do 
    visit('/messages/post')
    fill_in('message', with: 'I have posted a new message!')
    click_button('POST')

    expect(page).to have_content 'I have posted a new message!'
  end
end