feature 'Viewing peeps' do

  scenario 'viewing all peeps in browser' do
    visit('/')
    expect(page).to have_content "This is a peep!"
  end

end
