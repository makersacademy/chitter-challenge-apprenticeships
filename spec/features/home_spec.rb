feature 'Viewing the home page' do
    scenario 'visiting the home page' do
      visit('/')
      expect(page).to have_content "Chitter away!"
    end
end