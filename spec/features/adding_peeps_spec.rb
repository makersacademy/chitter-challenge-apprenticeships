feature 'Viewing peeps' do
  scenario 'viewing related timestamp' do
    visit('/peeps/add')
    fill_in('peep', with: 'Peep peep!')
    click_button('Post')
    expect(page).to have_content "Peep peep!"
  end
end
