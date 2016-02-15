class DashboardController < ApplicationController
  def user
    @hero_for_today_message = WorkDay.hero_for_today_message
    @upcoming_work_days     = current_user.upcoming_work_days.order(date: :asc)
    @full_schedule          = WorkDay.schedule_this_month.order(date: :asc)
  end
end
