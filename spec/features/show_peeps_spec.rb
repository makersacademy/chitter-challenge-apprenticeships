feature 'So that a user can see what people are doing' do

  scenario 'user can see peeps' do
    visit('/peeps')
    expect(page).to have_content("just started my coding challenge!")
  end
end
