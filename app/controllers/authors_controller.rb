class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
    @articles = Article.where(author_id: params[:id])
  end
 
  def new
  end

  def create
    @author = Author.new(author_params)

    @author.save
    redirect_to @author
  end

  private
    def author_params
      params.require(:author).permit(:first_name, :last_name, :email, :about)
    end
end