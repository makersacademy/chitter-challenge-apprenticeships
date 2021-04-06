require 'spec_helper'

feature 'searching and filtering the peeps' do
  scenario 'a user can filter peeps on a specific keyword' do
    visit('/peeps')
    fill_in('search', with: 'Testing')
    click_button('Submit')

    click_button('Return Button')
    expect(current_path).to eq('/peeps')
  end
end
