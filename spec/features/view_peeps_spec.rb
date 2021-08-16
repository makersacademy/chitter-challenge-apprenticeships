feature "peeps page" do 
  scenario "display all peeps (content only and date)" do 
    peep_date = Time.new.strftime("%Y-%m-%d")

    visit '/peeps/new'
    fill_in('peep_text', with: 'Test peep for FEATURE test A.')
    click_button('Submit')

    visit '/peeps/new'
    fill_in('peep_text', with: 'Test peep for FEATURE test B.')
    click_button('Submit')

    visit '/peeps/new'
    fill_in('peep_text', with: 'Test peep for FEATURE test C.')
    click_button('Submit')

    visit '/peeps'

    expect(page).to have_content(peep_date) #All test peeps will have the same post date
    expect(page).to have_content('Test peep for FEATURE test A.')  
    expect(page).to have_content('Test peep for FEATURE test B.') 
    expect(page).to have_content('Test peep for FEATURE test C.') 
  end 
  
end 