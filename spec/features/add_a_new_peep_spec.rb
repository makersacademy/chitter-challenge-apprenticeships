feature 'to let the world know what important thing I am doing' do
  scenario 'i want to add a new post' do
    visit('/')

    within '.list-group' do
      fill_in('peep', with: 'I am currently singing under the shower')
      click_button
    end

    expect(page).to have_content('I am currently singing under the shower')
  end
end
