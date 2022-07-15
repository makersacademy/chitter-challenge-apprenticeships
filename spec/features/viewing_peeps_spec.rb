# in spec/features/viewing_peeps_spec.rb

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/peeps')

    expect(page).to have_content "This is a peep!"
  end
end
