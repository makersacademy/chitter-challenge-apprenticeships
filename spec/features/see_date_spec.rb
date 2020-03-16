feature 'View list of peeps' do
  scenario 'user visits the homepage' do
    visit '/'

    expect(page).to have_content "2020-03-13"
  end
end
