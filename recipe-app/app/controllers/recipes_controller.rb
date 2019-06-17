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
    if params[:name].empty || params[:ingredients].empty
      @recipe=Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cooke_time])
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
      if !is_logged_in?
      redirect to '/login'
    end
    @recipe=Recipe.find(params[:id])
    erb :"/recipes/show"
  end

  get "/recipes/:id/edit" do
     if !is_logged_in?
       redirect to '/login'
     end 
     @recipe = Recipe.find(params[:id])
       if current_user.id != @recipe.user_id
       end

    erb :"/recipes/edit"
  end

  # PATCH: /recipes/5
  patch "/recipes/:id" do
    @recipe=Recipe.find(params[:id])
    @recipe.name=params[:name]
    @recipe.ingredients=params[:ingredients]
    @recipe.cook_time=params[:cook_time]
    @recipe.save 
    redirect "/recipes/:id"
  end

 
  delete "/recipes/:id/delete" do
    @recipe=Recipe.find_by_id(params)
    @recipe.delete 
    
    redirect "/recipes"
  end
end
