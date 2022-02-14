feature 'homepage list' do
  scenario 'displays all peeps' do
    enter_peep('Hello there')
    enter_peep('General Kenobi')

    expect(page).to have_content 'Hello there'
    expect(page).to have_content 'General Kenobi'
  end

  scenario 'displays peeps by latest' do
    enter_peep("The first post")
    enter_peep("The second post")

    visit('/by_latest')

    expect(find("h4", match: :first)).to have_content "The second post"
  end
end
