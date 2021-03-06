class ArticlesController < ApplicationController

  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create

    @article = Article.new(article_params)

    if @article.save

      flash.notice = "Article #{@article.title} was created!"

      redirect_to article_path(@article)
    else
      flash[:erros] = "you gave me some bullshit...try again asshole"
      render :new
    end

  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash.notice = "Article #{@article.title} was deleted!"

    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article #{@article.title} was updated!"

    redirect_to article_path(@article)
  end

  private



  # def set_song
  #   @article = Article.find(params[:id])
  # end

end
