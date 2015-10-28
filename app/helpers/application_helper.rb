module ApplicationHelper

  def display_time_elapsed(time)
    if minutes_elapsed(time) < 1
      "Less than a minute ago"
    elsif minutes_elapsed(time) > 60
      "More than an hour ago"
    else
      "About #{minutes_elapsed(time)} minutes ago"
    end
  end

  def minutes_elapsed(time)
    ((Time.now - time)/60).to_i
  end

end
