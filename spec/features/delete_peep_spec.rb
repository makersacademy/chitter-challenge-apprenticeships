feature 'delete peep' do
  scenario 'delete peep' do
    create_peep
    login
    visit '/peeps'
    expect(page).to have_content 'First tweet'
    click_button 'delete'
    expect(page).to_not have_content 'First tweet'
    expect(Peep.all.length).to eq 0
  end
end