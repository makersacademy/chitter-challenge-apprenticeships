feature 'Redirect on /:' do
  scenario 'is sent to the /peeps endpoint from /' do
    visit('/')
    expect(page).to have_current_path "/peeps"
  end
end
