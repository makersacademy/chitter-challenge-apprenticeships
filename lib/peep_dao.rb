class PeepDao
  
  class << self
    def all
      all_peeps = []
      connection = connect_to_db
      result = connection.exec("SELECT * FROM peeps")
      result.each do |peep|
        all_peeps << Peep.new(peep['message'], peep['date'])
      end
      all_peeps
    end

    def create(peep)
      connect_to_db.exec_params("INSERT INTO peeps(message, date) VALUES ($1, $2);", [peep.message, peep.date])
    end

    private

    def connect_to_db
      database_name = ENV['RACK_ENV'] == 'development' ? 'chitter' : 'chitter_test'
      PG.connect dbname: database_name, user: ENV['USER']
    end
  end

end