class MoviesController < ApplicationController
  before_action :authenticate_user!
  def index
    @movies = Movie.all
  end
  
  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create 
    @movie = Movie.new(movie_params)
    @movie.image.attach(params[:movie][:image])
    
    if @movie.save
      redirect_to @movie
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  
  def movie_params
    params.require(:movie).permit(:name, :description, :genre, :director_name, :language, :release, :run_time, :status, :image)
  end
end
