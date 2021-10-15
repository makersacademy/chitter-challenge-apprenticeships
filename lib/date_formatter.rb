require 'date'

class DateFormatter
  STRP_TIME_FORMAT = '%Y-%m-%d'.freeze
  STRF_TIME_FORMAT = '%d/%m/%y'.freeze

  def self.format_date(date)
    date = Date.strptime(date, STRP_TIME_FORMAT)
    date.strftime(STRF_TIME_FORMAT)
  end
end
