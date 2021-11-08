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

  def sort_descending
    @list = @list.sort_by { |peep| peep.date }.reverse
  end

  def filter(keyword)
    @list.sort_by { |peep| peep.date }.reverse.select { |peep| peep.message.include? keyword }
  end
end
