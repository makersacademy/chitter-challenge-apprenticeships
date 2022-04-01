feature 'Peeps are shown in reverse order' do
  scenario 'User can see several peeps ordered in reverse chronological order' do
    visit '/peeps'

    fill_in 'message', with: 'Oldest sibling'
    click_button 'Submit'
    fill_in 'message', with: 'Middle sibling'
    click_button 'Submit'
    fill_in 'message', with: 'Youngest sibling'
    click_button 'Submit'

    expect(first('.peep')).to have_content 'Youngest sibling'
    expect(all('.peep').last).to have_content 'Oldest sibling'
  end
end
