require 'date'
TODAY = (Date.today-1).strftime("%Y-%m-%d")
TODAY_1 = (Date.today - 2).strftime("%Y-%m-%d")
TODAY_2 = (Date.today - 3).strftime("%Y-%m-%d")
feature 'list_sorted_by_descending_date' do
  scenario 'list_descending_date' do
    visit('/')
    within_table('peeps_table') do
      expect(page).to have_text /#{TODAY}.+#{TODAY_1}.+#{TODAY_2}/
    end
  end
end
