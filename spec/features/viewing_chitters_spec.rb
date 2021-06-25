feature 'viewing chitter messages' do
  scenario 'peeps are visible onscreen' do
    visit '/'

    expect(page).to have_content 'This is a peep'

  end
end
