feature 'Testing infrastructure' do    
  scenario 'expect page to be working' do
    visit '/'
    expect(page.status_code) == 200
  end
end
