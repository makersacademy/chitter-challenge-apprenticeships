feature 'Homepage' do
  scenario 'redirects user to peeps feed' do
    visit('/')
    expect(page).to have_current_path('/peeps')
  end
end
