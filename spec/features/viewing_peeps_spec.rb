feature 'Viewing peeps' do

  # feature 'homepage' do
  #   scenario 'the page title is visible' do
  #     visit '/'
  #     expect(page).to have_content 'CHITTERRR'
  #   end
  # end


# feature 'Viewing peeps' do
  scenario 'A user can see peeps on his feed' do
    visit('/peep')
    expect(page).to have_content "this is my first peep!"
    expect(page).to have_content "this is my second peep!"
    expect(page).to have_content "this is my third peep!"
  end
# end
end 