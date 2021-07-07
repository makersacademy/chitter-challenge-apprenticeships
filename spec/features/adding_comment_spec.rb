feature 'adding message' do
  scenario 'add a comment' do
    visit '/new'
    fill_in('message', with: "adfa")
    click_button('Submit')

    expect(page).to have_content "adfa"
  end 
end
