class WorkDay < ActiveRecord::Base
  belongs_to :user

  def self.hero_for_today_message
    date = find_by_date(Date.today)

    if date && date.user
      user_name = date.user
      "Today's Support Hero is #{user_name}!"
    elsif date
      "No Support Hero today—nobody is schedule!"
    else
      "No Support Hero today, it isn't a work day!"
    end
  end

  def self.schedule_this_month
    month_start = Date.today.beginning_of_month
    month_end   = Date.today.end_of_month
    where(date: month_start..month_end)
  end

  def self.valid?(date)
    true if weekday?(date)
  end

  def to_s
    date.strftime('%a %b %d, %Y')
  end

  def swappable_days(user)
    self.class.where("user_id IS NOT NULL AND user_id != ? AND date > ?", user.id, Date.today)
  end

  def self.swap_work_days(original, requested)
    original_user  = original.user

    original.user  = requested.user
    requested.user = original_user

    transaction do
      original.save
      requested.save
    end



    # original_date  = original.date
    # requested_date = requested.date
    #
    # original.date  = requested_date
    # requested.date = original_date
    #
    # transaction do
    #   original.save
    #   requested.save
    # end
  end

  def next_open_work_day(start_date)
    self.class.order(date: :asc)
      .find_by('user_id IS NULL AND date > ?', start_date.date)
  end

  def user
    super || "***OPEN SHIFT***"
  end

  def self.reschedule(user, original, requested)
    original_work_day  = where(date: original).first
    requested_work_day = where(date: requested).first

    original_work_day.date  = nil
    requested_work_day.user = user

    transaction do
      original_work_day.save
      requested_work_day.save
    end
  end

  private

  def self.weekday?(date)
    weekdays    = [1,2,3,4,5]
    day_of_week = date.wday
    weekdays.include?(day_of_week)
  end
end
