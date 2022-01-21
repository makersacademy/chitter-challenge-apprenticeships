
def check_leading_zero(day)
  @day = day
  if @day<10
    return "0#{@day}"
  else
    return @day.to_s
  end

end