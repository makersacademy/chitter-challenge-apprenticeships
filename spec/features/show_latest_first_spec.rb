feature 'Show latest first' do
  scenario 'A user can see the peeps in reverse chronological order' do
    visit '/messages'
    peep1 = 'Databases are complicated :('
    peep2 = 'They are hard to understand!'
    peep3 = 'There are so many of them!!!'
    test_time = Time.local(2021, 11, 5, 10, 5, 8)
    Timecop.freeze(test_time)
    fill_in 'new_peep', with: peep1
    click_button('Peep!')
    test_time = Time.local(2021, 11, 6, 10, 5, 8)
    Timecop.freeze(test_time)
    fill_in 'new_peep', with: peep2
    click_button('Peep!')
    test_time = Time.local(2021, 11, 7, 10, 5, 8)
    Timecop.freeze(test_time)
    fill_in 'new_peep', with: peep3
    click_button('Peep!')

    expect(page.body.index(peep1)).to be > page.body.index(peep2)
    expect(page.body.index(peep2)).to be > page.body.index(peep3)

    click_button('Toggle Newest/Oldest')

    expect(page.body.index(peep3)).to be > page.body.index(peep2)
    expect(page.body.index(peep2)).to be > page.body.index(peep1)

  end
end
