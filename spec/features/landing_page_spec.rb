feature 'landing page' do
  scenario '-it displays the posts on a landing page' do
    visit('/')
    save_and_open_page
    expect(page).to have_content 'This is a peep!' 
  end

end