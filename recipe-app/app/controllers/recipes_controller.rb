class RecipesController < ApplicationController

  # GET: /recipes
  get "/recipes" do
    if is_logged_in?
      @recipes = Recipe.all
      @user= current_user
      erb :"/recipes/recipes"
    else redirect to '/login'
    end
  end
  
  post "/recipes" do
      @recipe=Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time[:cooke_time])
    redirect "/recipes/"
  end 

  get "/recipes/new" do
    if is_logged_in
    erb  :"/recipes/new"
  else 
    redirect "/login"
    end 
  end


  get "/recipes/:id" do
    @recipe=Recipe.find(params[:id])
    erb :"/recipes/show"
  end

  get "/recipes/:id/edit" do
     @recipe = Recipe.find(params[:id])

    erb :"/recipes/edit"
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
