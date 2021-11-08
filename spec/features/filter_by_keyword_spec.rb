require 'date'
feature 'filter by keyword' do
  subject.add(TEST_PEEP)
  subject.add(TEST_POOP)
  subject.add(TEST_CHOCOLATE)
  scenario 'display peep ones' do
    visit('/')
    fill_in :keyword, with: 'Peep'
    click_button 'Filter'

    within_table('peeps_table') do
      expect(page).to have_content 'Peep'
      expect(page).not_to have_content 'Poop'
    end
  end
end
