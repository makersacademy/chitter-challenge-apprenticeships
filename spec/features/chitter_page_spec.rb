feature 'Viewing Chitter page' do
  scenario 'visiting the Chitter page' do
    visit('/Chitter')
    submit_a_message
    expect(page).to have_content "This is my first post!"
  end
end
