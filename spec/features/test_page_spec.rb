
feature 'Viewing test page' do
  scenario 'visiting the test page' do
    visit('/test')
    expect(page).to have_content "Test page"
  end
end

feature 'view all the messages' do
  scenario 'user visits view messages page' do
    visit('/view_messages')
    expect(page).to have_content "This is a peep"
    expect(page).to have_content "and another peep"
  end
end
