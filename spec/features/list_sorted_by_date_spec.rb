require 'date'
TODAY = Date.today.strftime("%m/%d/%Y")
TODAY_1 = (Date.today - 1).strftime("%m/%d/%Y")
TODAY_2 = (Date.today - 2).strftime("%m/%d/%Y")
feature 'list_sorted_by_descending_date' do
  scenario 'list_descending_date' do
    $peeps = Peeps.new(
      [
        Peep.new("This is a peep!", TODAY_1),
        Peep.new("This is a peep!", TODAY),
        Peep.new("This is a peep!", TODAY_2),
      ]
    )
    visit('/all_peeps')
    within_table('peeps_table') do
      expect(page).to have_text /#{TODAY}.+#{TODAY_1}.+#{TODAY_2}/
    end
  end
end
