feature 'Reversing chronological order of peeps' do
  scenario 'visiting the index page and reversing order of peeps' do
    visit('/')
    click_button("Reverse Chronological Order")
    # TODO: how to assert on order reversing?
  end
end