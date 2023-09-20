module ApplicationHelper
  def short_date(date)
    # Jan 1
    date.strftime("%b %e")
  end

  def medium_date(date)
    # January 1 
    date.strftime("%B %e")
  end

  def long_date(date)
    # January 1, 2023
    date.strftime("%B %d, %Y")
  end

  def short_weekday(date)
    date.strftime("%a")
  end

  def date_with_weekday(date)
    date.strftime("%a, %b %e")
  end

  def relative_date(date)
    if date == Date.current
      "Today"
    elsif date == Date.current - 1.day
      "Yesterday"
    else
      date_with_weekday(date)
    end
  end

  def month_year(date)
    Date.current.strftime("%B %Y")
  end

  def time_until_tomorrow
    distance_of_time_in_words(Time.current, Time.current.tomorrow.beginning_of_day)
  end

  def dotiw(t1,t2)
    distance_of_time_in_words(t1, t2)
  end

  def big_rotate
    ['rotate-6', 'rotate-3', '-rotate-6', '-rotate-3', 'rotate-12', -'rotate-12'].sample
  end

  def slight_rotate
    ['rotate-1', 'rotate-2', '-rotate-1', '-rotate-2'].sample
  end

end
