feature 'Adding peeps' do
  scenario 'visiting peeps page to add more peeps' do
    chitter_skip
    fill_in('peep', with: 'Beep Bappp Boooo BEEEEEEEP!')
    click_button('Submit')
    expect(page).to have_content "Here are the latest peeps!!\nBeep Bappp Boooo BEEEEEEEP!\nPlease fill in the below form to make your peeps!"
  end
end
