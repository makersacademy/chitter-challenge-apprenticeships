feature 'Viewing post page' do
  scenario 'visiting the post page' do
    visit('/post')
    expect(page).to have_selector 'input[type=submit]'
    expect(page).to have_selector 'textarea'
  end

  scenario 'submitting a peep' do
    content = rand.to_s
    visit('/post')
    within 'form#post-peep' do
      fill_in 'content', with: content
    end
    find('#post-peep input[type=submit]').click
    expect(page).to have_content content
  end

  scenario 'search visited without a query' do
    visit('/search')
    expect(page).to have_current_path '/'
  end

  scenario 'search visited with a query' do
    visit('/search?query=cheese')
    expect(page).to have_content 'Search results for cheese'
  end
end
