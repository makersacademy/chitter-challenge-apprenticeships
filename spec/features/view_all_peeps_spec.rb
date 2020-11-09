feature 'Viewing all peeps' do
  scenario 'I can see all the peeps on my page' do
    Peep.write(message: 'Hello there')
    Peep.write(message: 'A peep')
    visit '/'
    expect(page).to have_content('Hello there', 'A peep')
  end
end
