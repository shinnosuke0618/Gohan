class Public::GenresController < ApplicationController
  def index
    @genres = Genre.page(params[:page])
  end

  def show
     @genre = Genre.find(params[:id])
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :introduction)
  end
end
