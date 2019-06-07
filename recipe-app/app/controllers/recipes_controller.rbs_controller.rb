class RecipesController.rbsController < ApplicationController

  # GET: /recipes_controller.rbs
  get "/recipes_controller.rbs" do
    erb :"/recipes_controller.rbs/index.html"
  end

  # GET: /recipes_controller.rbs/new
  get "/recipes_controller.rbs/new" do
    erb :"/recipes_controller.rbs/new.html"
  end

  # POST: /recipes_controller.rbs
  post "/recipes_controller.rbs" do
    redirect "/recipes_controller.rbs"
  end

  # GET: /recipes_controller.rbs/5
  get "/recipes_controller.rbs/:id" do
    erb :"/recipes_controller.rbs/show.html"
  end

  # GET: /recipes_controller.rbs/5/edit
  get "/recipes_controller.rbs/:id/edit" do
    erb :"/recipes_controller.rbs/edit.html"
  end

  # PATCH: /recipes_controller.rbs/5
  patch "/recipes_controller.rbs/:id" do
    redirect "/recipes_controller.rbs/:id"
  end

  # DELETE: /recipes_controller.rbs/5/delete
  delete "/recipes_controller.rbs/:id/delete" do
    redirect "/recipes_controller.rbs"
  end
end
