feature 'viewing messages' do 

  scenario 'the page title is visible' do
    visit '/'
    expect(page).to have_content 'Welcome to the Chitter System'
  end

  scenario 'list of messsage do'  do   
    
    Comments.create(message: 'Test 1')
    Comments.create(message: 'test')
    Comments.create(message: 'test')

    visit '/'

    expect(page).to have_content 'Test 1'
    expect(page).to have_content 'test'
    expect(page).to have_content 'test'

  end



 


end 