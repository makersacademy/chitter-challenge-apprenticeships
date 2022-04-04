require './lib/peep'

feature 'Viewing peeps' do
    scenario 'A user can see peeps' do

      Peep.add(message: "peep1", username: 'jenny123')
      Peep.add(message: "peep2", username: 'benny123')

      visit '/peeps'

      expect(page).to have_content('peep1', 'jenny123')
      expect(page).to have_content('peep2', 'benny123')
    end
  end