
feature 'view peeps' do
  scenario 'you can see peeps' do
    visit '/peeps'
    expect(page).to have_content 'test user'
    expect(page).to have_content 'test message'
  end

  scenario 'you can see the time and date that a peep was posted' do
    visit '/peeps'
    expect(page).to have_content Date.today.to_s
    expect(page).to have_content Time.new.hour.to_s
    expect(page).to have_content Time.new.min.to_s
  end
end
