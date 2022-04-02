feature 'Viewing messages' do
  scenario 'view all messages in the browser' do
    visit('/chitter')
    click_button 'View all Messages'
    expect(current_path).to eq '/peeps'
  end
end
