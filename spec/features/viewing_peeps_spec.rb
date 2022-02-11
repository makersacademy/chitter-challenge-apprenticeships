feature 'Viewing peeps' do

  scenario 'viewing all peeps in browser' do
    visit('/')
    expect(page).to have_content "I've got blisters on me fingers!"
  end
  
end
