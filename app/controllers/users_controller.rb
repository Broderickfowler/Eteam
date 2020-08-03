class UsersController < ApplicationController
    
    get '/signup' do
        if logged_in?
            redirect '/teams'
        else
        erb :'users/new'
        end
    end


    post '/users' do 
        if params[:email] == "" || params[:password] == ""
            flash[:notice] = "You must enter in a email and password to signup"
            redirect to '/signup'
        else
            
        @user = User.new
        @user.email = params[:email]
        @user.password = params[:password]
         @user.save
         session[:user_id] = @user.id
            redirect to '/teams'
        
        end
    end

    get '/login' do
     if !logged_in?
        flash[:notice] ="You need to logged in"
        erb :'users/login'
     else
        redirect to '/teams'
     end
    end
    

    post '/login' do 
        @user = User.find_by(:email => params[:email])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect '/teams'
            elsif params[:email] == "" || params[:password] == ""
                flash[:notice] = "You must enter in a email and password"
                redirect '/'
            else
                redirect '/signup'
        end
    end

    get '/logout' do 
        session.destroy
        redirect '/'
    end
end