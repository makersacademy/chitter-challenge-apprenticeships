
feature 'Post message' do
  scenario 'User can post a message' do
    visit '/post_message'
    find_field('peep').value
    find_button('Submit').click
  end
end
