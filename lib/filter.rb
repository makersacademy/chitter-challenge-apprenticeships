class Filter
  def self.include(word)
    @include = word
  end

  def self.query
    @include
  end
end