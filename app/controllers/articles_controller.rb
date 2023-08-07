class ArticlesController < ApplicationController
  # A frequent practice is to place the standard CRUD actions in each controller
  # in the following order: index, show, new, edit, create, update and destroy.

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    # Create a new model instance using the params hash
    # params[:article]: "article"=>{"title"=>"Title of Article", "body"=>"Body text"}
    @article = Article.new(article_params)

    # Save the model in the database
    if @article.save
      # Redirect the user to the show action
      redirect_to @article
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def article_params
    # params[:article]: "article"=>{"title"=>"Title of Article", "body"=>"Body text"}
    params.require(:article).permit(:title, :body)
  end
end
