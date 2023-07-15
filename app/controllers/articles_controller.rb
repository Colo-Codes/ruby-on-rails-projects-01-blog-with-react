class ArticlesController < ApplicationController
  def new; end

  def create
    # Create a new model instance using the params hash
    # params[:article]: "article"=>{"title"=>"Title of Article", "body"=>"Body text"}
    @article = Article.new(article_params)

    # Save the model in the database
    @article.save

    # Redirect the user to the show action
    redirect_to @article
  end

  private

  def article_params
    # params[:article]: "article"=>{"title"=>"Title of Article", "body"=>"Body text"}
    params.require(:article).permit(:title, :body)
  end
end
