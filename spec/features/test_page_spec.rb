require 'date'
feature 'Viewing test page' do
  $peeps = Peeps.new(
    [
      Peep.new("This is a peep!", Date.today),
      Peep.new("This is a peep!", Date.today),
      Peep.new("This is a peep!", Date.today),
    ]
  )
  scenario 'visiting the test page' do
    visit('/test')
    expect(page).to have_content "Test page"
  end
end
