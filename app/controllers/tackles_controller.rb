class TacklesController < ApplicationController
  def index
    @tackles = Tackle.all
  end

  def show
  end

  def new
    @tackle = Tackle.new
    # ここでロッド、リール、ライン、ルアーのビルドを行う
    @tackle.tackle_rods.build.build_rod
    @tackle.tackle_reels.build.build_reel
    @tackle.tackle_lines.build.build_line
    @tackle.tackle_lures.build.build_lure
  end

  def create
    @tackle = current_user.tackles.build(tackle_params)
    if @tackle.save
      # 保存成功時の処理（例: 一覧ページへリダイレクト）
      redirect_to tackles_path, notice: 'タックルを登録しました。'
    else
      # 保存失敗時の処理（例: 新規登録フォームを再表示）
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def tackle_params
    params.require(:tackle).permit(:name, tackle_rods_attributes: [:id, rod_attributes: [:name, :year, :power, :length]], tackle_reels_attributes: [:id, reel_attributes: [:name, :year, :gear_ratio, :length]], tackle_lines_attributes: [:id, line_attributes: [:name, :kind, :line_weight, :length]], tackle_lures_attributes: [:id, lure_attributes: [:name, :kind, :lure_weight, :color]])
  end
end
