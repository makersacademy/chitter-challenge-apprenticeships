feature 'Viewing all peeps' do
  scenario 'visiting the home page' do
    visit('/')
    peeps = Peep.all
    expect(page).to have_content "This is a peep!"
  end
end

feature 'Adding a peep' do
  scenario 'Adding a peep to Chitter feed' do
    visit('/new')
    fill_in('peep', with: "It is a bit warm!")
    click_button('Peep')
    expect(page).to have_content "It is a bit warm!"
  end
end

