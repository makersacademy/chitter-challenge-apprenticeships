feature 'filtering peeps' do
  scenario 'searching for a peep with a keyword' do
    Peep.create(message: "Oh, hi doggy", date: "2021-05-19")
    Peep.create(message: "Cheep cheep cheep cheep", date: "2021-03-20")
    Peep.create(message: "Anything for my princess", date: "2021-05-15")

    visit('/findpeep')
    
    fill_in "peep", with: "doggy"
    click_button "Find my peep"


    expect(page).to have_content "Oh, hi doggy"
    expect(page).not_to have_content "Cheep cheep cheep cheep"
    expect(page).not_to have_content "Anything for my princess"
  end
end