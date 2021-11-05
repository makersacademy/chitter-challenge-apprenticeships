require 'spec_helper'

feature 'Viewing chitter page' do

  scenario 'visiting the chitter page' do
    visit('/chitter')
    expect(page).to have_content "Chitter"
  end

  scenario 'seeing a peep' do
    conn = PG.connect(dbname: 'chitter_test')
    Peeps.add(peep_text: 'This is a peep!')
    visit('/chitter')
    expect(page).to have_content "This is a peep!"
  end

end
