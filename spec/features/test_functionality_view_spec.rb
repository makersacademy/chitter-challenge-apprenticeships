feature 'testing /view functions' do
  
  scenario '- Visibility of the default peep from DB' do
    visit '/view'
    expect(page).to have_content "This is a peep!"
  end

end
