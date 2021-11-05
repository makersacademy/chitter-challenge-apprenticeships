feature 'Show latest first' do
  scenario 'A user can see the peeps in reverse chronological order' do
    visit '/messages'
    peep1 = 'Databases are complicated :('
    peep2 = 'They are hard to understand!'
    peep3 = 'There are so many of them!!!'
    add_peep(peep1, Time.local(2021,11,5))
    add_peep(peep2, Time.local(2021,11,6))
    add_peep(peep3, Time.local(2021,11,7))

    expect(page.body.index(peep1)).to be > page.body.index(peep2)
    expect(page.body.index(peep2)).to be > page.body.index(peep3)

    click_button('Toggle Newest/Oldest')

    expect(page.body.index(peep3)).to be > page.body.index(peep2)
    expect(page.body.index(peep2)).to be > page.body.index(peep1)

  end
end
