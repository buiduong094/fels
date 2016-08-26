class Admin::CategoriesController < ApplicationController
  before_action :check_admin

  def index
    @categories = Category.all.order("created_at DESC")
      .paginate page: params[:page], per_page: Settings.admin.category.per_page
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "page.category.create_category_success"
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @category = Category.find_by id: params[:id]
    if @category
      @category.destroy
      respond_to do |format|
        format.html {redirect_to categories_url}
        format.js
      end
    end
  end
end
