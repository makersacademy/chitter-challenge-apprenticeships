feature 'Viewing peeps' do
  scenario 'visiting the test page' do
    Peep.create(message: "This is a test peep")
    visit('/peeps')
    expect(page).to have_content "This is a test peep"
  end
end
