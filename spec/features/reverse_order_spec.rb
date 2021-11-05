#feature 'Peep order is reversed' do
#  scenario 'the order of the peeps is reversed' do
#    visit('/chitter')
#    click_button('Reverse Chronological Order')
#    reversepeeps = Peeps.all.reverse
#    reversepeeps = reversepeeps[0]
#    expect(page).to have_content(reversepeeps)
#  end
#end