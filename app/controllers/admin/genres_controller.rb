class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @genres = Genre.page(params[:page])
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path(@genre)
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path(@genres)
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :introduction)
  end
end
