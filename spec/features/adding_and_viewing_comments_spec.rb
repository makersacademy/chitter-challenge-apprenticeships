feature 'Adding and viewing comments' do
  scenario 'a comment is added to a peep' do
    peep = Peeps.add('Peep to comment on')

    visit '/'
    first('.peep').click_button 'Comment'

    expect(current_path).to eq "/#{peep.id}/comments/new"

    fill_in 'comment', with: 'This is a test comment on this bookmark'
    click_button 'Submit'

    expect(current_path).to eq '/'
    expect(first('.peep')).to have_content 'This is a test comment on this bookmark'
  end
end
