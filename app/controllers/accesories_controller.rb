class AccesoriesController < ApplicationController
  before_action :set_tackle, only: [:new, :create]

  def new
    @tackle = Tackle.find(params[:tackle_id])
    @accesory = @tackle.accesories.build
  end

  def create
    @tackle = Tackle.find(params[:tackle_id])
    @accesory = @tackle.accesories.build(accesory_params)
    if @accesory.save
      @tackle.accesories << @accesory
      # 別の書き方TackleRod.create(tackle: @tackle, rod: @rod)
      redirect_to @tackle
    else
      render :new
    end
  end

  private

  def set_tackle
    @tackle = Tackle.find(params[:tackle_id])
  end

  def accesory_params
    params.require(:accesory).permit(:name, :memo)
  end
end
