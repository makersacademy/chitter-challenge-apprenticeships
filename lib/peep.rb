class Peep

  attr_reader :message, :date

  def initialize(message, date)
    @message = message
    @date = date
  end

  def formatted_date
    Time.parse(@date).strftime("%d of %B, %Y, %I:%M %p")
  end

end