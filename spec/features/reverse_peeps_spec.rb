feature 'Reversing chronological order of peeps' do
  scenario 'visiting the index page and reversing order of peeps' do
    visit('/')
    expect(page).to have_content "Chitter Chitter"
  end
end