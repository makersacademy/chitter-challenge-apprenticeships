feature 'viewing links page' do
  scenario 'going to links page and seeing greeting' do
    sign_in_and_submit
    expect(page).to have_content("Barry\'s chitter account")
  end
end