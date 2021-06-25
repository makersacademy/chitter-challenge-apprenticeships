feature 'viewing chitter messages' do
  scenario 'peeps are visible onscreen' do
    Peeps.create(message: 'hi')
    visit '/'
    expect(page).to have_content 'hi'
  end
end
