feature 'Create Peep' do
  scenario 'add a peep and see it on the main page' do
    visit('/new')
    fill_in('message', with: 'This is a Peep')
    click_button('Peep it!')
    expect(page).to have_content 'This is a Peep'
  end
  scenario 'add a peep and see the date it was posted' do
    # So Date/times should be: 21/01/2022 at 14:06
    allow(Time).to receive(:now).and_return(1_642_774_001)
    visit('/new')
    fill_in('message', with: 'This is also a Peep')
    click_button('Peep it!')
    expect(page).to have_content 'This is also a Peep'
    expect(page).to have_content 'Posted: 21/01/2022 at 14:06'
  end
end
