# frozen_literal_string: true

feature 'Able to see date of post' do
  scenario 'see date in list view' do
    add_row_to_test_database
    visit('/')

    within('li') { expect(page).to have_content(/\d{2}-\d{2}-\d{4}/) }
  end
end
