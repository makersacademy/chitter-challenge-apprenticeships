feature 'Peep order is reversed' do
  scenario 'the order of the peeps is reversed' do
    visit('/chitter')
    click_button('Reverse Chronological Order')
    expect("Third Peep, HELLO Rajah!").to appear_before("First Peep, HELLO Aladdin!", only_text: true)
  end
end