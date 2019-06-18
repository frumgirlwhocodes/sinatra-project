class UsersController < ApplicationController


  get '/signup' do
    if !is_logged_in?  
      erb :'/users/sign_up'
    else
    redirect to '/recipes'
    end
  end
  post '/signup' do
		  if params[:username] == "" || params[:email] == "" || params[:password] == ""
			redirect '/signup'
		else
		user = User.create(params)
      session[:user_id] = user.id
		  redirect "/recipes"
		end 
		end 
  
  
   get '/login' do
    if is_logged_in?  
      redirect to '/recipes'
    else 

    erb :"/users/login"
  end
  
  post '/login' do 
user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/recipes'
    else
      erb :"/users/failure"
    end
  end
  
  get "/logout" do 
    session.clear 
    redirect "login"
    
  end 




  get '/users/:slug' do
    slug = params[:slug]
    @user = User.find_by_slug(slug)
    if current_user.id=@user.id 
  @recipes= @user.recipes
    erb :"/users/show"
  else 
    redirect "/login"
  end
end 
delete '/users/:slug/delete' do
    @user = User.find_by_slug(params[:slug])
    @user.destroy
    redirect "/"
 end

end
  
  end

 

 