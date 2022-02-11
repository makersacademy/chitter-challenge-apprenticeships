# in spec/features/viewing_bookmarks_spec.rb

feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end
end

# in spec/features/viewing_bookmarks_spec.rb

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/peeps')

    expect(page).to have_content "This is a peep!"
    
  end
end