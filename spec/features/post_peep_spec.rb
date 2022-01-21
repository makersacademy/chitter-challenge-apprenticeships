feature 'post peep' do
  scenario 'you can post a peep' do
    add_peep('post peep test user', 'post peep test post')

    expect(page).to have_content 'post peep test user'
    expect(page).to have_content 'post peep test post'
  end
end
