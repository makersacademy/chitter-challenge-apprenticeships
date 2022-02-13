feature 'Viewing peeps' do 
  scenario 'A user can see peeps' do
    visit('/peeps')
    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "Meditate to evolve."
    expect(page).to have_content "Stay in the present moment."
    expect(page).to have_content "Being of service to others is what brings true happiness."
  end 
end