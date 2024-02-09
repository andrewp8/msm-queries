class ActorsController < ApplicationController
  def index
    render({:template => "actors_templates/list"})
  end

  def show

    matching_records = Actor.where({:id => params.fetch("the_id")})
    
    @the_actor = matching_records.at(0)
    @matching_characters = Character.where({:actor_id => @the_actor.id})
    render({:template => "actors_templates/details"})
  end
end
