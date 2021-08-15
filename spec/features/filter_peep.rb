feature 'Be able to display only filtered peeps' do 
  scenario "Only display peeps containing keyword." do 
    visit '/peeps/new'
    fill_in('peep_text', with: 'Content to test the filter. car.')
    click_button('Submit')

    # visit '/peeps/new'
    # fill_in('peep_text', with: 'Content to test the filter. lorry.')
    # click_button('Submit')

    visit '/peeps' #Perhaps can omit
    fill_in('peep_filter', with: 'car')
    click_button('Submit')

    expect(page).to have_content('Content to test the filter. cr.')

    expect(page).to not_have_content("")
    #expect(page).to have_no_content("Content to test the filter. lorry.")


  end 

end 