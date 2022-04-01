require 'pg'

def test_data_script

    p "setting up test chitter"

    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("TRUNCATE peeps;")
end
