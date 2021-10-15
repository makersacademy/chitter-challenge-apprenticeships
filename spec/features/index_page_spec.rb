feature 'index page' do
  scenario 'can be visited' do
    visit('/')
    expect(page.status_code).to eq 200
  end

  scenario 'has a header' do
    visit('/')
    expect(page.find('.header')).to have_content 'Anonymous Peeps' 
  end

  scenario 'has peeps' do
    Peep.create(msg: 'Smoke on the water...')
    visit('/')
    expect(page.find('.peeps')).to have_content 'Smoke on the water...' 
  end
end
