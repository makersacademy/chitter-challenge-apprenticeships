feature 'homepage_feed_view' do
  scenario 'visiting the homepage' do
    visit('/')
    expect(page).to have_content 'PEEPS:'
  end

  scenario 'loading the peep feed' do
    visit('/')
    expect(page).to have_content 'This is a peep!'
  end
end