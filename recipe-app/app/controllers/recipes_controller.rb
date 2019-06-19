class RecipesController < ApplicationController


  get "/recipes" do
    if is_logged_in?
      @recipes = Recipe.all
      @user= current_user
      erb :"/recipes/recipes"
    else 
      redirect '/login'
    end
  end
  
  post "/recipes" do
    
    if params[:name].empty? || params[:ingredients].empty? || params[:cook_time].empty? 
       redirect to "recipes/new"
     else 
      recipe=Recipe.create(params)
     recipe.user == current_user
     recipe.save
    redirect "/recipes/#{recipe.id}"
end 
  end 

  get "/recipes/new" do
    if is_logged_in?
    erb  :"/recipes/new"
  else 
    redirect "/login"
    end 
  end


  get "/recipes/:id" do
   redirect '/login' if !is_logged_in? 
       
      @recipe = Recipe.find_by(id: params[:id])
      if session[:user_id] == current_user.id
      erb :'/recipes/show'
  else
    redirect "/recipes"
  end
end
      

  get "/recipes/:id/edit" do
   redirect to '/login'   if !is_logged_in?
     
     @recipe = Recipe.find_by_id( params[:id])

    erb :"/recipes/edit"
  end


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
    if is_logged_in?
    @recipe=Recipe.find(params[:id])
  
  if @recipe && current_user == @recipe.user
    @recipe.delete 
  end 
    redirect "/recipes"
  else 
    redirect "/login"
  end
end
end 
