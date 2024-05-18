class AccesoriesController < ApplicationController
  before_action :require_login
  before_action :set_tackle, only: %i[new create edit update destroy]
  before_action :set_accesory, only: %i[edit update destroy]

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

  def edit; end

  def update
    if @accesory.update(accesory_params)
      redirect_to @tackle
    else
      render :edit
    end
  end

  def destroy
    @accesory.tackle_accesories.destroy_all
    @accesory.destroy
    redirect_to @tackle
  end

  private

  def set_tackle
    @tackle = current_user.tackles.find(params[:tackle_id])
  end

  def set_accesory
    @accesory = @tackle.accesories.find(params[:id])
  end

  def accesory_params
    params.require(:accesory).permit(:name, :memo, :image)
  end
end
