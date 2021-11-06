require 'date'
feature 'filter by keyword' do
  scenario 'display peep ones' do
    $peeps = Peeps.new(
      [
        Peep.new("This is a peep!", Date.today.strftime("%Y-%m-%d")),
        Peep.new("This is a poop!", Date.today.strftime("%Y-%m-%d")),
        Peep.new("This is a peep!", Date.today.strftime("%Y-%m-%d")),
      ]
    )
    visit('/all_peeps')
    fill_in :keyword, with: 'peep'
    click_button 'Filter'

    within_table('peeps_table') do
      expect(page).to have_content 'peep'
      expect(page).not_to have_content 'poop'
    end
  end
end
