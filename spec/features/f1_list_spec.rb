# frozen_literal_string: true

feature 'Viewing list page' do
  scenario 'confirming user is viewing the list page' do
    visit('/list')
    expect(page.current_path).to eq '/list'
  end

  scenario 'list of messages viewable' do
    add_row_to_test_database
    visit('/list')

    expect(page).to have_content 'This is a test cheep!'
  end 
end
