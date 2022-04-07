feature 'Viewing added peeps' do 
  scenario 'adds peeps to the list' do 
    visit('/chitter')
    click_button('Post a Peep')

    expect(current_path).to eq '/drafts'

    fill_in('message', with: 'This is my first peep!')
    click_button('Submit')
    expect(current_path).to eq '/chitter'
    click_button('View all Peeps')

    expect(page).to have_content "This is my first peep!"
  end 
end 
