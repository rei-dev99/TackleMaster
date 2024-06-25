class TacklesController < ApplicationController
  before_action :require_login
  before_action :set_tackle, only: %i[edit update destroy]

  def index
    @tackles = current_user.tackles.page(params[:page]).per(6)
  end

  def show
    @tackle = current_user.tackles.includes(:rods, :reels, :accesories).find(params[:id])
  end

  def new
    @tackle = Tackle.new
  end

  def create
    @tackle = current_user.tackles.build(tackle_params)
    if @tackle.save
      redirect_to tackle_path(@tackle), notice: t('tackles.create.success')
    else
      flash.now[:alert] = t('tackles.create.failure')
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @tackle.update(tackle_params)
      redirect_to tackles_path, notice: t('tackles.update.success')
    else
      flash.now[:alert] = t('tackles.update.failure')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tackle.destroy
    redirect_to tackles_path, notice: t('tackles.destroy.success'), status: :see_other
  end

  private

  def set_tackle
    @tackle = current_user.tackles.find(params[:id])
  end

  def tackle_params
    params.require(:tackle).permit(:name, :image)
  end
end
