# frozen_literal_string: true

feature 'able to view add page' do
  scenario 'confirm add button available on list page' do
    visit('/')

    expect(page.has_button?('Add')).to be_truthy
  end

  scenario 'confirm add button goes to add page' do
    visit('/')
    click_button('Add')

    expect(page.current_path).to eq '/add'
  end

  scenario 'confirm cheep message box and post button are available' do
    visit('/')
    click_button('Add')

    expect(page.has_field?('message')).to be_truthy
    expect(page.has_button?('Post')).to be_truthy
  end
end
