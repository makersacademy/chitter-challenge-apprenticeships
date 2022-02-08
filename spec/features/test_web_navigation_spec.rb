feature 'navigating controller layout' do

  scenario '- entry point / available  ' do
    visit "/"
    expect(page).to have_content "Welcome to Chitter"  
    expect(page).to have_content "Please select:"
  end

  scenario '- Visiting /view Site' do
    visit "/"
    click_button("View")
    expect(page).to have_content "Chitter View"
  end
  
  scenario '- Visiting /add Site' do
    visit "/"
    click_button("Add")
    expect(page).to have_content "Chitter Add"
    expect(page).to have_content "Add your text:"
  end
    
end