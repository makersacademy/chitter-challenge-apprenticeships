require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM peeps WHERE id = #{id};")
  result.first
end

def add_peep(message)
  visit('/peeps/new')
  fill_in('message', with: message)
  click_button('Post')
end
