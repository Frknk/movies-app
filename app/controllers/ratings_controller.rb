class RatingsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @rating = Rating.find_or_initialize_by(user: current_user, movie: @movie)
    @rating.assign_attributes(rating_params)

    if @rating.save
      redirect_to @movie, notice: 'Rating was successfully created/updated.'
    else
      render 'movies/show'
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:value)
  end
end

