feature 'Viewing peeps' do
  scenario 'A user can see the peeps' do
    visit('/chitter')

    expect(page).to have_content "This is peep 1"
  end
end