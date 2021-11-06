require 'date'
feature 'Viewing test page' do
  $peeps = Peeps.new(
    [
      Peep.new("This is a peep!", Date.today.strftime("%m/%d/%Y")),
      Peep.new("This is a peep!", Date.today.strftime("%m/%d/%Y")),
      Peep.new("This is a peep!", Date.today.strftime("%m/%d/%Y")),
    ]
  )
  scenario 'visiting the test page' do
    visit('/test')
    expect(page).to have_content "Test page"
  end
end
