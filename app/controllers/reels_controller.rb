class ReelsController < ApplicationController
  before_action :set_tackle, only: [:new, :create]

  def new
    @tackle = Tackle.find(params[:tackle_id])
    @reel = @tackle.reels.build
  end

  def create
    @tackle = Tackle.find(params[:tackle_id])
    @reel = @tackle.reels.build(reel_params)

    if @reel.save
      @tackle.reels << @reel
      redirect_to @tackle
    else
      render :new
    end
  end

  private

  def set_tackle
    @tackle = Tackle.find(params[:tackle_id])
  end

  def reel_params
    params.require(:reel).permit(:name, :memo)
  end
end
