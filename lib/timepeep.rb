require 'date'

class PeepTime

  def self.now
    date = DateTime.now
    "#{date.year} #{'%02d' % date.month} #{'%02d' % date.day}"
  end
end