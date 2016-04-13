class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  #this is for the new template, we pass in a @article to be used in the form/when creating it
  def new
    @article = Article.new
  end

  #when we press submit/create article this takes in what we input and save it into @article
  def create
    #article_params because the input is sent through the paramaters
    @article = Article.new(article_params)
    if @article.save
      #a quick notice of whats happening
      flash[:notice] = "Article was successfully saved"
      redirect_to article_path(@article)#article/show
    else
      render 'new'#invoke the new method/pull up the form
    end
  end

  def show
    #@article = Article.find(params[:id])#grabs article from db, with id from param
  end

  def edit#same thing for new to new.html, this is for edit.html
    #@article = Article.find(params[:id])
  end

  def update#same as create
    #@article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def index
    @articles = Article.all
  end
  
  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "article was deleted"
    redirect_to articles_path
  end

  #this class method helps us take whats passed into paramaters
  private
  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:name, :description)
  end

end