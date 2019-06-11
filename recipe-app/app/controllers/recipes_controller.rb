class RecipesController < ApplicationController

  # GET: /recipes
  get "/recipes" do
    if is_logged_in?
      @recipes = Recipe.all
      @recipe= current_user
      erb :"/tweets/tweets"
    else redirect to '/login'
    end
  end
    
  
   post "/recipes" do
      @recipe=Recipe.create(params)
    redirect "/recipes"
  end


  # GET: /recipes/new
  get "/recipes/new" do
  
    erb :"/recipes/new.html"
  end


 
  # GET: /recipes/5
  get "/recipes/:id" do
    erb :"/recipes/show.html"
  end

  # GET: /recipes/5/edit
  get "/recipes/:id/edit" do
    erb :"/recipes/edit.html"
  end

  # PATCH: /recipes/5
  patch "/recipes/:id" do
    redirect "/recipes/:id"
  end

  # DELETE: /recipes/5/delete
  delete "/recipes/:id/delete" do
    redirect "/recipes"
  end
end
