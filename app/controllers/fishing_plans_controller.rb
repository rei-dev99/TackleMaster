class FishingPlansController < ApplicationController
  before_action :require_login
  before_action :set_plan, only: %i[edit update destroy]

  def index
    @plans = current_user.fishing_plans.order(created_at: :desc)
    @tackles = current_user.tackles.order(created_at: :desc)
  end

  def new
    @plan = FishingPlan.new
    @tackles = current_user.tackles
  end

  def create
    @plan = current_user.fishing_plans.build(fishing_plan_params)
    if @plan.save
      redirect_to fishing_plans_path, notice: t('fishing_plans.create.success')
    else
      @tackles = current_user.tackles
      flash.now[:alert] = t('fishing_plans.create.failure')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @tackles = current_user.tackles
  end

  def update
    if @plan.update(fishing_plan_params)
      redirect_to fishing_plans_path, notice: t('fishing_plans.update.success')
    else
      @tackles = current_user.tackles
      flash.now[:alert] = t('fishing_plans.update.failure')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @plan.destroy
    redirect_to fishing_plans_path, notice: t('fishing_plans.destroy.success'), status: :see_other
  end

  private

  def set_plan
    @plan = current_user.fishing_plans.find(params[:id])
  end

  def set_tackle
    @tackles = current_user.tackles
  end

  def fishing_plan_params
    required_params = [
      :fishing_date,
      :location,
      :tackle_id,
      :temperature,
      :wind_speed,
      :weather_condition,
      :precipitation_probability,
      :fish_types
    ]
    params.require(:fishing_plan).permit(*required_params)
  end
end
