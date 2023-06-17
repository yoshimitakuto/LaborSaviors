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
      flash[:notice] = "カテゴリーの追加に成功しました。"
      redirect_to admin_categories_path
    else
      flash[:notice] = "カテゴリーの追加に失敗しました。"
      render :new
    end
  end

  def destroy
    if Category.find(params[:id]).destroy
      flash[:notice] = "削除しました。"
      redirect_to request.referer
    else
      flash[:notice] = "削除に失敗しました。"
      render :index
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
