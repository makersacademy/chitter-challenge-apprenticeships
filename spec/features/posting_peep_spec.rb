require 'timecop'

feature 'Posting a new peep' do
  scenario 'User can post a peep to Chitter' do
    visit('/')
    fill_in('message', with: 'I have arrived!')
    click_button('Submit')

    expect(page).to have_content 'I have arrived!'
  end

  # scenario 'View the time message was posted' do
  #   Timecop.freeze do
  #     visit('/peeps/new')
  #     fill_in('message', with: 'I have arrived!')
  #     click_button('Submit')

  #     expect(page).to have_content DateTime.now.strftime("%l:%M %p on %b %e, %Y")
  #   end
    
  # end

end