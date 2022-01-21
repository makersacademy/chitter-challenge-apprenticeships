feature 'viewing peeps' do
  scenario 'visiting the homepage' do
    visit('/')
    expect(page).to have_content("My peeps")
  end

  scenario 'showing a list of peeps' do
    visit('/')
    expect(page).to have_content("My first peep" && "Second peep" && "Third peep")
  end
end