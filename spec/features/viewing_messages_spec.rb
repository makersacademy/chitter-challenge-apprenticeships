feature 'Viewing messages' do
  scenario 'A user can see messages' do
    
    visit('/message')

    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "Hello everyonep!"
    expect(page).to have_content "How are you!"
  end
end