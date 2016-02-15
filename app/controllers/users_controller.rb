class UsersController < ApplicationController
  def reschedule
    original = user_params[:original_date].to_date
    desired  = user_params[:reschedule_date].to_date

    if WorkDay.reschedule(current_user, original, desired)
      redirect_to :back, notice: "Rescheduled!"
    else
      render "dashboard/user"
    end
  end

  private

  def user_params
    params.permit(:original_date, :reschedule_date)
  end
end
