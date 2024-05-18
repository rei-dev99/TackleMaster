class TacklesController < ApplicationController
  before_action :require_login

  def index
    @tackles = current_user.tackles
  end

  def show
    # @tackle = Tackle.includes(:rods, :reels, :accesories).find(params[:id])
    @tackle = current_user.tackles.includes(:rods, :reels, :accesories).find(params[:id])
  end

  def new
    @tackle = Tackle.new
  end

  def create
    @tackle = current_user.tackles.build(tackle_params)
    if @tackle.save
      # 保存成功時 一覧ページへリダイレクト
      redirect_to tackles_path
    else
      # 保存失敗時 新規登録フォームを再表示
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @tackle = current_user.tackles.find(params[:id])
    @tackle.destroy
    redirect_to tackles_path, notice: 'タックルを削除しました', status: :see_other
  end

  private

  def tackle_params
    params.require(:tackle).permit(:name, :image)
  end
end
