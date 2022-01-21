feature 'view peeps' do
  scenario 'you can see peeps' do
    visit '/'
    expect(page).to have_content 'test user'
    expect(page).to have_content 'test peep'
  end
end
