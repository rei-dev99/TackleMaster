class ReelsController < ApplicationController
  before_action :require_login
  before_action :set_tackle, only: %i[show new create edit update destroy]
  before_action :set_reel, only: %i[show edit update destroy]

  def show; end

  def new
    @reel = @tackle.reels.build
  end

  def create
    @reel = @tackle.reels.build(reel_params)
    if @reel.save
      @tackle.reels << @reel
      redirect_to @tackle, notice: t('reels.create.success')
    else
      flash.now[:alert] = t('reels.create.failure')
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @reel.update(reel_params)
      redirect_to @tackle, notice: t('reels.update.success')
    else
      flash.now[:alert] = t('reels.update.failure')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reel.tackle_reels.destroy_all
    @reel.destroy
    redirect_to @tackle, notice: t('reels.destroy.success'), status: :see_other
  end

  private

  def set_tackle
    @tackle = current_user.tackles.find(params[:tackle_id])
  end

  def set_reel
    @reel = @tackle.reels.find(params[:id])
  end

  def reel_params
    params.require(:reel).permit(:name, :maker, :memo, :image)
  end
end
