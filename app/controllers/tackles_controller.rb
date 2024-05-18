class TacklesController < ApplicationController
  def index
    @tackles = Tackle.all
  end

  def show
    @tackle = Tackle.includes(:rods, :reels, :accesories).find(params[:id])
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
  end

  private

  def tackle_params
    params.require(:tackle).permit(:name, :image)
  end
end
