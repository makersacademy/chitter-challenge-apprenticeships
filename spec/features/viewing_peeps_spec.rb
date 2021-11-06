require 'peep'

feature 'Viewing peeps' do
  scenario 'Viewing a list of peeps' do
    Peep.create(message: "Test peep!")
    visit('/peeps')
    expect(page).to have_content "Test peep!"
  end
end
