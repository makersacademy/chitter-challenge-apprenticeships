feature 'Returns posts containing keyword provided' do
  scenario 'Enter keyword in form' do
    visit('/posts')
    fill_in('keyword', with: 'Svit')
    click_button ('Submit')
    expect(page).to have_content 'Posts containing keyword:'
  end
end
