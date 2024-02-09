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

  def search
    searched_movie = params.fetch("searched_movie")
    @search_results = Movie.where("title LIKE ?", "%#{searched_movie}%")
    render({:template => "movies_templates/searches"})
  end

  def before2000
    @before2000_movies = Movie.where("extract(year from year) < ?", 2000)
    render({:template => "movies_templates/before2000"})
  end
end
