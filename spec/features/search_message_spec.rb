feature 'Search messages' do
  scenario 'Shows message like keyword' do
    Message.create(message: 'blahh')
    Message.create(message: 'test_2')
    Message.create(message: 'rahhh')

    visit('/')
    click_button('Search')
    fill_in('keyword', with: "test")
    click_button('Search')
    
    expect(page).to have_content("test_2")

  end
end
