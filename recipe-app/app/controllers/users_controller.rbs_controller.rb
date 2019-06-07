class UsersController.rbsController < ApplicationController

  # GET: /users_controller.rbs
  get "/users_controller.rbs" do
    erb :"/users_controller.rbs/index.html"
  end

  # GET: /users_controller.rbs/new
  get "/users_controller.rbs/new" do
    erb :"/users_controller.rbs/new.html"
  end

  # POST: /users_controller.rbs
  post "/users_controller.rbs" do
    redirect "/users_controller.rbs"
  end

  # GET: /users_controller.rbs/5
  get "/users_controller.rbs/:id" do
    erb :"/users_controller.rbs/show.html"
  end

  # GET: /users_controller.rbs/5/edit
  get "/users_controller.rbs/:id/edit" do
    erb :"/users_controller.rbs/edit.html"
  end

  # PATCH: /users_controller.rbs/5
  patch "/users_controller.rbs/:id" do
    redirect "/users_controller.rbs/:id"
  end

  # DELETE: /users_controller.rbs/5/delete
  delete "/users_controller.rbs/:id/delete" do
    redirect "/users_controller.rbs"
  end
end
