# frozen_literal_string: true

feature 'Able to see date of post' do
  scenario 'see date in list view' do
    add_row_to_test_database
    visit('/')

    within('li') { expect(page).to have_content(/\d{2}-...-\d{4}/) }
  end

  scenario 'see dates in reverse order in list view' do
    result1 = add_row_to_test_database
    result2 = add_row_to_test_database
    result3 = add_row_to_test_database
    visit('/')

    expect(page.all('li')[0].value).to eq result3[0]['id']
    expect(page.all('li')[1].value).to eq result2[0]['id']
    expect(page.all('li')[2].value).to eq result1[0]['id']
  end
end
