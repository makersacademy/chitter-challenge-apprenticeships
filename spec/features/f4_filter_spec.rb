# frozen_literal_string: true

feature 'Able to filter posts on keyword' do
  scenario '- enter keyword to filter on' do
    add_test_data_to_database
    visit('/')
    fill_in('filter', with: "this")
    click_button('Apply Filter')

    actual_value = page.all('li').select { |element| element.text.match(/this/i) }
    test_value = page.all('li')

    expect(actual_value.size).to eq(test_value.size)
  end
end
