feature 'Viewing post page' do
  scenario 'visiting the post page' do
    visit('/post')
    expect(page).to have_selector 'input[type=submit]'
    expect(page).to have_selector 'textarea'
  end

  scenario 'submitting a peep' do
    content = rand.to_s
    visit('/post')
    within 'form' do
      fill_in 'content', with: content
    end
    find('input[type=submit]').click
    expect(page).to have_content content
  end
end
