class Peep 
  attr_reader :name, :content, :timestamp
  def initialize(name:, content:, timestamp:)
    @name = name
    @content = content
    @timestamp = timestamp
  end

  def keywords 
    @content.split(" ").select{ |word| word.include?("#")}
  end
end