class Peep
  attr_reader :id, :message, :date

  def initialize(id:,message:,date:)
    @id = id
    @message= message
    @date = date
  end
end