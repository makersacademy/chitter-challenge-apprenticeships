feature 'list_sorted_by_descending_date' do
  scenario 'list_descending_date' do
    $peeps = Peeps.new(
      [
        Peep.new("This is a peep!", '15Oct'),
        Peep.new("This is a peep!", '14Oct'),
        Peep.new("This is a peep!", '13Oct'),
      ]
    )
    visit('/all_peeps')
    within_table('peep_table') do
      expect(page).to have_text /15Oct.+14Oct.+13Oct/
    end
  end
end

