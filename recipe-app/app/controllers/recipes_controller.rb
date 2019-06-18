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
    
    if params[:name].empty? || params[:ingredients].empty? || params[:cook_time].empty? 
       redirect to "recipes/new"
     else 
      recipe=Recipe.create(params)
      #(:name => params[:name], :ingredients =>  params[:ingredients], :cook_time =>  params[:cooke_time], :user_id => user.id )
     current_user.recipes << recipe
    redirect "/recipes/#{recipe.id}"
end 
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
         redirect "/recipes"
       end

    erb :"/recipes/edit"
  end

  # PATCH: /recipes/5
  patch "/recipes/:id" do
     if params[:name].empty? || params[:ingredients].empty? || params[:cook_time].empty?
      redirect "recipes/#{params[:id]}/edit" 
    end 
    @recipe=Recipe.find(params[:id])
    @recipe.name=params[:name]
    @recipe.ingredients=params[:ingredients]
    @recipe.cook_time=params[:cook_time]
    @recipe.save 
    redirect "/recipes/#{@recipe.id}"
  end

 
  delete "/recipes/:id/delete" do
    if is_logged_in 
    @recipe=Recipe.find(params[:id])
  
  if @recipe && current_user == @recipe.user_id 
    @recipe.delete 
  end 
    redirect "/recipes"
  else 
    redirect "/login"
  end
end
end 
