class UsersController < ApplicationController


  get '/signup' do
    if !is_logged_in?  
      erb :'/users/create_user'
    else
    redirect to '/tweets'
    end
  end
  
  
   get '/login' do
    if is_logged_in?  
      redirect to '/recipes'
    end

    erb :"/users/login"
  end
  
  post '/login'
user = User.find_by(:username => params["username"])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/recipes'
    else
      redirect to '/login'
    end
  end




  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end
end

 

 