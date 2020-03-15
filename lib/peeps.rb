class Peeps
 attr_reader :peeps
  def initialize
    @peeps = ["This is a peep!"]
  end

  def view_all
    @peeps
  end
end
