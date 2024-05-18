class RodsController < ApplicationController
  before_action :require_login
  before_action :set_tackle, only: [:new, :create]

  def new
    @rod = @tackle.rods.build
  end

  def create
    @rod = @tackle.rods.build(rod_params)
    if @rod.save
      @tackle.rods << @rod
      # 別の書き方TackleRod.create(tackle: @tackle, rod: @rod)
      redirect_to @tackle
    else
      render :new
    end
  end

  private

  def set_tackle
    @tackle = current_user.tackles.find(params[:tackle_id])
  end

  def rod_params
    params.require(:rod).permit(:name, :memo, :image)
  end
end
