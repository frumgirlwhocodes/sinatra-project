class UsersController < ApplicationController


  get '/signup' do
    if !is_logged_in?  
      erb :'/users/create_user'
    else
    redirect to '/recipes'
    end
  end
  post '/signup' do
		if params[:username].empty? || params[:email].empty? || params[:password].empty?
			redirect '/signup'
		else
		  user=User.create(params)
		  session[:id]=user.id 
		  redirect "/recipes"
		end 
		end 
  
  
   get '/login' do
    if is_logged_in?  
      redirect to '/recipes'
    end

    erb :"/users/login"
  end
  
  post '/login' do 
user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/recipes'
    else
      erb :failure
    end
  end
  
  get "/logout" do 
    session.clear 
    redirect "login"
    
  end 




  get '/users/:slug' do
    slug = params[:slug]
    @user = User.find_by_slug(slug)
  @recipes= @user.recipes
    erb :"/users/show.html"
  end
  
  end

 

 