require 'pg'


feature "Viewing all messages" do 
  scenario 'a USER CAN VIEW ALL MESAAGES' do 
  connection = PG.connect(dbname: 'chitter_test')
  
    
    # ADD TEST DATA
    connection.exec("INSERT INTO peeps VALUES(1, 'This is a peep!');")

    visit('/messages')

    expect(page).to have_content 'This is a peep!'
    
  end
end