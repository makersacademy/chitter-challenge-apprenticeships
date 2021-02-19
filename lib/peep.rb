class Peep 
  attr_reader :user, :content, :timestamp
  def initialize(user:, content:, timestamp:)
    @user = user
    @content = content
    @timestamp = timestamp
  end

  def keywords 
    @content.split(" ").select{ |word| word.include?("#")}
  end
end