feature 'view peeps' do
  scenario 'you can see peeps' do
    visit '/'
    expect(page).to have_content 'test peep'
    expect(page).to have_content 'test user'
  end
end
