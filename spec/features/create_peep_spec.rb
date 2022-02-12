feature 'creating peeps' do
  scenario 'A user can create peeps' do
    ENV['ENVIRNOMENT'] = 'test'
    visit('/')
    fill_in('message', with: 'test_peep')
    click_button('Submit')

    expect(page).to have_content 'test_peep'
  end
end