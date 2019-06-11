class UsersController < ApplicationController


  get '/signup' do
    if !is_logged_in?  
      erb :'/users/create_user'
    else
    redirect to '/tweets'
    end
  end


  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end
end

 

 