require 'pg'

# As a Maker
# So that I can see what people are doing
# I want to see all the messages (peeps)
# in a browser
feature 'See all messages' do 
	scenario 'A user can see messages' do 
		connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'Its fun here on chitter');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Come on chitter to have great banter');")
    connection.exec("INSERT INTO peeps VALUES(3, 'This is a peep!');")

		visit('/peeps')

		expect(page).to have_content 'Its fun here on chitter'
		expect(page).to have_content 'Come on chitter to have great banter'
		expect(page).to have_content 'This is a peep!'
	end
end

