class UsersController < ApplicationController


  # GET: /users/new
  get "/users/new" do
    erb :"/users/create_user.html"
  end


  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

 

 