class RodsController < ApplicationController
  before_action :require_login
  before_action :set_tackle, only: %i[new create edit update destroy]
  before_action :set_rod, only: %i[edit update destroy]

  def new
    @rod = @tackle.rods.build
  end

  def create
    @rod = @tackle.rods.build(rod_params)
    if @rod.save
      @tackle.rods << @rod
      redirect_to @tackle, notice: t('rods.create.success')
    else
      flash.now[:alert] = t('rods.create.failure')
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @rod.update(rod_params)
      redirect_to @tackle, notice: t('rods.update.success')
    else
      flash.now[:alert] = t('rods.update.failure')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # rodsテーブルのレコードを削除しようとしたときに、そのレコードがtackle_rodsテーブルで参照されているため、外部キー制約に違反
    @rod.tackle_rods.destroy_all
    @rod.destroy
    redirect_to @tackle, notice: t('rods.destroy.success'), status: :see_other
  end

  private

  def set_tackle
    @tackle = current_user.tackles.find(params[:tackle_id])
  end

  def set_rod
    @rod = @tackle.rods.find(params[:id])
  end

  def rod_params
    params.require(:rod).permit(:name, :memo, :image)
  end
end
