class MoviesController < ApplicationController
  def index
    render({:template => "movies_templates/list"})
  end

  def show
    matching_records = Movie.where({:id => params.fetch("the_id")})
    
    @the_movie = matching_records.at(0)

    matching_director = Director.where({:id => @the_movie.director_id}).at(0)
    @the_movie_director = matching_director
    render({:template => "movies_templates/details"})
  end
end
