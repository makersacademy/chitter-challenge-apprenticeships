feature 'Viewing peeps' do

  scenario 'visiting the index page' do
    visit ('/')
    expect(page).to have_content "Peep Manager"
  end

  scenario 'see peeps' do
    visit ('/peeps')

    expect(page).to have_content 'This is a peep!'
    expect(page).to have_content 'I saw a fox!'
  end
end
