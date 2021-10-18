require './lib/chitter_model'

feature 'view messages(peeps)' do
  scenario 'A maker can see peeps' do
    ChitterModel.add_peeps(message: "This is a peep!")
    ChitterModel.add_peeps(message: "This is also a peep!")

    visit '/view-peeps'

    expect(page).to have_content("This is a peep!")
    expect(page).to have_content("This is also a peep!")
  end
end

