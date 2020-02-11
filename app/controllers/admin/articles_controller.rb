class Admin::ArticlesController < Admin::BaseController
  before_action :set_article, only: [:edit, :update, :destory, :show]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = 'created success'
      redirect_to [:admin, :articles]
    else
      flash[:error] = 'created failed'
      render :new
    end
  end

  def edit

  end

  def update
    if @article.update(article_params)
      flash[:success] = 'updated success'
      redirect_to [:admin, :articles]
    else
      flash[:error] = 'updated failed'
      render :edit
    end
  end

  def destroy
    if @article.destory
      flash[:success] = 'destoryed success'
    else
      flash[:error] = 'destoryed failed'
    end
     redirect_to [:admin, :articles]
  end

  def show

  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :category_id)
  end
end
