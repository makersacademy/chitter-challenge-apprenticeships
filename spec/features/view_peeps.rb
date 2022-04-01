feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    Peeps.create(message: "hello")
    Peeps.create(message: "it's")
    Peeps.create(message: "me")
    visit('/chitter/peeps')
    expect(page).to have_content("hello")
    expect(page).to have_content("it's")
    expect(page).to have_content("me")
  end
end
