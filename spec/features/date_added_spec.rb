feature 'adding messages' do
    scenario 'date automatically assigned to every veriable' do

        Peeps.create(message: 'Lets Party')
        visit('/')
        expect(page).to have_content "2020-05-22"
      end


end