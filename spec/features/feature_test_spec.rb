feature 'Viewing test page' do
  scenario 'visiting the test page' do
    visit('/test')
    expect(page).to have_content "Test page"
  end
end

feature '/peeps route' do
  scenario 'displays all peeps' do
    visit('/peeps')

    expect(page).to have_content("This is a peep!")
    expect(page).to have_content("We're going to build a well!")
    expect(page).to have_content("Noone needs to pay for it- we got you!")
    expect(page).to have_content("Hang on who needs wells these days anyways?")
  
  end
end    