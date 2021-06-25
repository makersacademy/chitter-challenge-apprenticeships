feature 'Index page' do
  scenario 'index page displays peeps' do
    visit '/'
    expect(page).to have_content "This is the first peep!"
  end
end

