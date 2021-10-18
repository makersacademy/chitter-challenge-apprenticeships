feature "viewing peeps" do 
  scenario do
    visit('/')
    expect(page).to have_content("This is a peep!")
  end
end