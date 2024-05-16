class RodsController < ApplicationController
  before_action :set_tackle, only: [:new, :create]

  def new
    @tackle = Tackle.find(params[:tackle_id])
    @rod = @tackle.rods.build
  end

  def create
    @tackle = Tackle.find(params[:tackle_id])
    @rod = @tackle.rods.build(rod_params)
    if @rod.save
      redirect_to @tackle
    else
      render :new
    end
  end

  private

  def set_tackle
    @tackle = Tackle.find(params[:tackle_id])
  end

  def rod_params
    params.require(:rod).permit(:name, :year, :power, :length)
  end
end
