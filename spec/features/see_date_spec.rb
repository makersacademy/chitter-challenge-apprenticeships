feature 'View list of peeps' do
  scenario 'user visits the homepage' do
    visit '/'

    expect(page).to have_content "13/03/2020"
  end
end
