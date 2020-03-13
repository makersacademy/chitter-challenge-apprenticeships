feature 'View list of peeps' do
  scenario 'user visits the homepage' do
    visit '/'

    expect(page).to have_content "This is a peep!"
  end
end
