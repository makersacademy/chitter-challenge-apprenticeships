feature 'Viewing index page' do
  scenario 'visiting the index page and see title' do
    visit('/')
    expect(page).to have_content "Chitter Chitter"
  end
  
  scenario 'See test post' do
    visit('/')
    expect(page).to have_content "This is a peep!"
  end
end
