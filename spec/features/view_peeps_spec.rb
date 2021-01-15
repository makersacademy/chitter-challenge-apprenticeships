feature 'Viewing peeps' do
  scenario 'A user sees all messages in a browser' do
    visit('/peeps')

    expect(page).to have_content 'This is a peep!'
    expect(page).to have_content 'This is another peep!'
    expect(page).to have_content 'And this is also a peep!'
  end
end
