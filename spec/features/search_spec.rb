feature 'search' do
  scenario 'for keyword' do
    enter_peep("Never toss a dwarf!")
    enter_peep("You step into the Road, and if you don't keep your feet, there is no knowing where you might be swept off to.")

    fill_in('search', with: 'dwarf')
    click_on('Search')

    expect(page).to have_content "Never toss a dwarf"
    expect(page).to_not have_content "step into the Road"
  end
end
