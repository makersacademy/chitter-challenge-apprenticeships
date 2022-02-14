feature 'viewing peeps' do
  scenario 'A user can see peeps' do
    ENV['ENVIRNOMENT'] = 'test'
    visit('/')
    expect(page).to have_content "Chitter Peeps"
  end
end