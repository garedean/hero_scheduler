class WorkDaysController < ApplicationController
  def update
    original_work_date  = WorkDay.find(params[:id])
    requested_work_date = WorkDay.find(work_day_params[:id])

    if WorkDay.swap_work_days(original_work_date, requested_work_date)
      flash[:notice] = "Success! You just swapped a work day."
    else
      flash[:alert]  = "Something went wrong with the swap... Refresh and try again."
    end
    redirect_to :back
  end

  private

  def work_day_params
    params.require(:work_day).permit(:id)
  end
end
