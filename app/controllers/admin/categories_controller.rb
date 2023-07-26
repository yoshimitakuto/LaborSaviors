class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    # 今後カテゴリー数が増えた時ように上限を「10」に指定
    @categories = Category.page(params[:page]).per(10)
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, success: "カテゴリーの追加に成功しました。"
    else
      redirect_to request.referer, danger: "カテゴリー名を入力してください。"
    end
  end

  def destroy
    if Category.find(params[:id]).destroy
      redirect_to request.referer, success: "カテゴリーを削除しました。"
    else
      flash.now[:danger] = "削除に失敗しました。"
      render :index
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
