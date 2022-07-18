require 'timecop'

feature 'adding a new message' do
  scenario 'a user can add a message to Chitter' do
    Timecop.freeze(Time.local(2022, 7, 15)) do
      visit('/peeps/new')
      fill_in('message', with: 'Example peep')
      click_button('Submit')
    end

    expect(page).to have_content 'Example peep (2022-07-15)'
  end
end
