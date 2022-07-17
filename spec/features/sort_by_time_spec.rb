feature 'Sorting posts by date in descending order' do
  scenario 'visiting the sort-by page' do
    visit('posts/sort-by')
    expect(page).to have_content "Posts sorted by date/time:"
  end
end
