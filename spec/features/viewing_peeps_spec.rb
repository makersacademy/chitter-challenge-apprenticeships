feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/peeps')

    expect(page).to have_content "Pizza burned the inside of my mouth and I really don't understand why the things I love keep hurting me."
    expect(page).to have_content "I need a room full of mirrors so I can be surrounded by winners"
    expect(page).to have_content "Caffeine doesn't do it anymore I need someone to text me 'We need to talk'"
  end
end
