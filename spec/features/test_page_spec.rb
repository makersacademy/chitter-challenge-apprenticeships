feature 'Viewing test page' do
  scenario 'visiting the test page' do
    visit('/test')
    expect(page).to have_content "Test page"
  end

  scenario 'viewing the message board' do
    visit('/messageboard')
    expect(page).to have_content "Welcome to the Chitter Channel"
    expect(page).to have_content "OMG loving these bangers!"
  end

  scenario 'opens chitter form to add peep' do
    visit('/chatter')
  end
end


