class FishingPlansController < ApplicationController
  before_action :require_login
  before_action :set_plan, only: %i[edit update destroy]

  def index
    @plans = current_user.fishing_plans
  end

  def new
    @plan = FishingPlan.new
  end

  def create
    @plan = current_user.fishing_plans.build(fishing_plan_params)
    if @plan.save
      redirect_to fishing_plans_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @plan.update(fishing_plan_params)
      redirect_to fishing_plans_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @plan.destroy
    redirect_to fishing_plans_path, notice: "釣行予定を削除しました", status: :see_other
  end

  private

  def set_plan
    @plan = current_user.fishing_plans.find(params[:id])
  end

  def fishing_plan_params
    params.require(:fishing_plan).permit(:fishing_date, :location, :temperature, :wind_speed, :weather_condition, :precipitation_probability, :fish_types)
  end
end
