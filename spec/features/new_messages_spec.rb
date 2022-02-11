feature 'adding a new message' do
  scenario 'A user can add a message to peeps table' do
    visit('/message/new')
    fill_in('message', with: 'this is exciting right?')
    click_button('Upload Message')

    expect(page).to have_content 'this is exciting right?'
  end
end
