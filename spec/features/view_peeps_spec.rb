feature 'user can see all peeps on their feed' do
  scenario 'user visits homepage and sees peeps there' do
    visit('/')
    expect(page).to have_content 'This is a peep!'
  end
end