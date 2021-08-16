feature 'homepage_feed_view' do
  scenario 'visiting the homepage' do
    visit('/peeps')
    expect(page).to have_content 'PEEPS:'
  end

  scenario 'loading the peep feed' do
    visit('/peeps')
    expect(page).to have_content 'This is a test peep'
  end
end