class Peeps

  def initialize(list = [])
    @list = list
  end

  def list
    raise 'Empty List' if @list.empty?
    @list
  end

  def last_record
    @list[-1]
  end

  def add(peep)
    @list << peep
  end
end