feature 'Sorting peeps by date' do
  scenario "sort peeps" do    
    visit("/home")
    fill_in('message', with: "I'm a new peep 1")
    fill_in('message', with: "I'm a new peep 2")
    fill_in('message', with: "I'm a new peep 3")
    click_button('Post Peeps')
    click_button('New peeps on top')
    expect(Message.all.first.message).to eq "I'm a new peep 3"
  end
end
