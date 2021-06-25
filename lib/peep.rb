class Peep
  attr_reader :username, :message, :id

  def self.add(username:, message:)
    created = DatabaseConnection.query(sql: "INSERT INTO peeps (username, message) VALUES($1, $2) RETURNING id, username, message;", params: [username, message])
    Peep.new(
      username: created[0]['username'],
      message: created[0]['message'],
      id: created[0]['id']
    )
  end

  def self.all
    peeps = DatabaseConnection.query(sql: 'SELECT * FROM peeps;', params: [])
    peeps.map do |peep|
      Peep.new(
        username: peep['username'],
        message: peep['message'],
        id: peep['id']
      )
    end
  end

  def initialize(username:, message:, id:)
    @username = username
    @message = message
    @id = id
  end
end
