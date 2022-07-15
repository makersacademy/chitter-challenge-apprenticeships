feature 'Viewing all peeps' do
  scenario 'visiting the home page' do
    visit('/')
    peeps = Peep.all
    expect(page).to have_content "This is a peep!"
  end
end

