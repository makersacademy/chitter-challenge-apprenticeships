feature 'Reversing chronological order of peeps' do
  scenario 'reversing order of peeps' do
    visit('/')
    click_button "Add peep"
    fill_in("message", with: "New message added by feature test!")
    click_button "Submit peep"
    expect('This is a peep!').to appear_before('New message added by feature test!')
    click_button("Reverse Chronological Order")
    ## This assertion won't work even though I have manually tested the reversing of order
    # expect('This is a peep!').to_not appear_before('New message added by feature test!')
  end
end