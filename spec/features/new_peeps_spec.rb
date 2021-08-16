feature "new peeps page" do 
  scenario "able to submit a new peep" do 
    visit '/peeps/new'
    peep_date = Time.new.strftime("%Y-%m-%d")

    visit '/peeps/new'
    fill_in('peep_text', with: 'Test peep for FEATURE test D.')
    click_button('Submit')

    visit '/peeps'

    expect(page).to have_content("Test peep for FEATURE test D.")
    expect(page).to have_content(peep_date)

  end 
end 