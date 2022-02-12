feature 'Viewing peeps' do
  scenario 'A user can view all peeps in the browser' do
    Peep.create(message: "Thinking of something funny to peep")
    
    visit('/peeps')
    expect(page).to have_content "Thinking of something funny to peep"
  end
end
