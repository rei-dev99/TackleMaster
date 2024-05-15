class RodsController < ApplicationController
  before_action :set_tackle, only: [:new, :create]

  def new
    @rod = @tackle.rods.build
  end
  
  def create
    @rod = @tackle.rods.build(rod_params)
    if @rod.save
      redirect_to @tackle
    else
      render :new
    end
    # binding.pry
  end

  private

  def set_tackle
    @tackle = Tackle.find(params[:tackle_id])
  end

  def rod_params
    params.require(:rod).permit(:name)
  end
end
