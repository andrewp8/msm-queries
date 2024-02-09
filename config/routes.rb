Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors", {:controller => "directors", :action => "index"})

  get("/directors/youngest", {:controller => "directors", :action => "youngest"})

  get("/directors/eldest", {:controller => "directors", :action => "eldest"})
  
  get("/directors/younger_than_55", {:controller => "directors", :action => "younger_than_55"})

  get("/directors/:the_id", {:controller => "directors", :action => "show"})

  get("/movies", {:controller => "movies", :action => "index"})

  get("/movies/search/", {:controller => "movies", :action => "search"})
  
  get("/movies/before2000/", {:controller => "movies", :action => "before2000"})

  get("/movies/:the_id", {:controller => "movies", :action => "show"})

  get("/actors", {:controller => "actors", :action => "index"})

  get("/actors/:the_id", {:controller => "actors", :action => "show"})
end
