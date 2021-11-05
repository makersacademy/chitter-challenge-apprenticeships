feature 'Viewing test page' do
  $peeps = Peeps.new(
    [
      Peep.new("This is a peep!", '13Oct'),
      Peep.new("This is a peep!", '15Oct'),
      Peep.new("This is a peep!", '14Oct'),
    ]
  )
  scenario 'visiting the test page' do
    visit('/test')
    expect(page).to have_content "Test page"
  end
end
