class DirectorsController < ApplicationController
  def index
    render({:template => "directors_templates/list"})
  end
end
