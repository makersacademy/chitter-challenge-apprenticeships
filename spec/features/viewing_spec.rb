feature 'Viewing peeps page' do
  scenario 'visiting peeps page to see the peeps' do
    chitter_skip
    expect(page).to have_content "Here are the latest peeps!!\nPlease fill in the below form to make your peeps!"
  end
end
