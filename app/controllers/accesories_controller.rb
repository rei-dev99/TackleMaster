class AccesoriesController < ApplicationController
  before_action :require_login
  before_action :set_tackle, only: [:new, :create]

  def new
    @accesory = @tackle.accesories.build
  end

  def create
    @accesory = @tackle.accesories.build(accesory_params)
    if @accesory.save
      @tackle.accesories << @accesory
      redirect_to @tackle
    else
      render :new
    end
  end

  private

  def set_tackle
    @tackle = current_user.tackles.find(params[:tackle_id])
  end

  def accesory_params
    params.require(:accesory).permit(:name, :memo, :image)
  end
end
