# gem httparty読み込み
require 'httparty'
# URIモジュールを読み込む（URLのエンコードや解析に使われる）
require 'uri'

class FishingPlansController < ApplicationController
  before_action :require_login
  before_action :set_plan, only: %i[edit update destroy]

  def index
    @plans = current_user.fishing_plans
    @tackles = current_user.tackles
  end

  def new
    @plan = FishingPlan.new
    @tackles = current_user.tackles
  end

  def create
    @plan = current_user.fishing_plans.build(fishing_plan_params)
    if @plan.save
      redirect_to fishing_plans_path
    else
      @tackles = current_user.tackles
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @tackles = current_user.tackles
  end

  def update
    if @plan.update(fishing_plan_params)
      redirect_to fishing_plans_path
    else
      @tackles = current_user.tackles
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

  def set_tackle
    @tackles = current_user.tackles
  end

  def fishing_plan_params
    params.require(:fishing_plan).permit(:fishing_date, :location, :tackle_id, :temperature, :wind_speed, :weather_condition, :precipitation_probability, :fish_types)
  end

  def weather_service
    api_key = ENV['OPEN_WEATHER_ID']
    @options 
  end
end
