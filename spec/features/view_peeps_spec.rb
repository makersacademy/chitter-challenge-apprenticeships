feature 'Viewing peeps' do
  scenario 'A user sees all messages in a browser' do
    visit('/peeps')

    expect(page).to have_content 'This is a peep!'
  end
end
