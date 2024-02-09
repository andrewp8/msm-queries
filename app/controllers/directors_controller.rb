class DirectorsController < ApplicationController
  def index
    render({:template => "directors_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")

    """ 
      - where({:id => the_id})
        + .where() is one of **Active Record** skill
        + the hash, {}, inside the parenthesis is called **hash literal**
        + The return value from calling .where() is called an **Relation**
          + A relation: a collection of records, doesn't matter if it is 1 or many records, [[],...], so we access the target record the same way we access the element of an array
    """
    matching_records = Director.where({:id => the_id})
    
    @the_director = matching_records.at(0)

    @matching_movies = Movie.where({:director_id => @the_director.id})

    render({:template => "directors_templates/details"})
  end

  def youngest
    @youngest_director = Director.where.not({:dob => nil}).order({:dob =>:desc }).first
    render({:template => "directors_templates/youngest"})
  end

  def eldest
    @eldest_director = Director.where.not({:dob => nil}).order({:dob =>:asc }).first
    render({:template => "directors_templates/eldest"})
  end
end
