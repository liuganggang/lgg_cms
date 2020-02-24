class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: [:edit, :update, :destory, :show]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'created success'
      redirect_to [:admin, :categories]
    else
      flash[:error] = 'created failed'
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      flash[:success] = 'updated success'
      redirect_to [:admin, :categories]
    else
      flash[:error] = 'updated failed'
      render :edit
    end
  end

  def destroy
    if @category.destory
      flash[:success] = 'destoryed success'
    else
      flash[:error] = 'destoryed failed'
    end
     redirect_to [:admin, :categories]
  end

  def show; end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
