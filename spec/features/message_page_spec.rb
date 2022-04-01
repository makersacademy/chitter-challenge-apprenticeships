feature 'message_page' do 

  scenario 'page is retrievable' do

    visit('/message_page')
    
    expect(page).to have_content 'Welcome'

  end 

  scenario 'can view messages on page' do 

    add_row_to_test_database

    visit('/message_page')

    expect(page).to have_content 'This is a peep!'

  end 

  scenario 'can add a new message and view on message_page' do 

    visit('/add')

    fill_in('message', with: 'Hello World!')
    click_on 'Submit Message'

    expect(page).to have_content 'Hello World!'
    expect(page).to have_content Time.now.strftime("%d/%m/%Y")

  end 

  scenario 'checks messages are ordered in desc order' do 

    visit('/add')

    fill_in('message', with: 'Hello World!')
    click_on 'Submit Message'

    visit('/add')

    fill_in('message', with: 'Bye World!')
    click_on 'Submit Message'

    expect(MessageHandler.all.first.message).to eq 'Bye World!'

  end 

  scenario 'checks we can filter/unfilter messages' do

    visit('/add')

    fill_in('message', with: 'Hello World!')
    click_on 'Submit Message'

    visit('/add')

    fill_in('message', with: 'Bye World!')
    click_on 'Submit Message'

    visit('/filter')

    fill_in('filter', with: 'Hello')
    click_on 'Filter Messages'

    expect(page).to have_content 'Hello World!'
    expect(page).to_not have_content 'Bye World!'

    click_on 'Reset Filter'

    expect(page).to have_content 'Hello World!'
    expect(page).to have_content 'Bye World!'

  end 

end 
