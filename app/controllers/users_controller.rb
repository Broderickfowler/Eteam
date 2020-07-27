class UsersController < ApplicationController
    
    get '/signup' do
        if logged_in?
            redirect '/teams'
        else
        erb :'users/new'
        end
    end


    post '/users' do 
        @user = User.new
        @user.email = params[:email]
        @user.password = params[:password]

            if @user.save
                redirect '/'
            else
                erb :'users/new'
         end
    end

    get '/login' do
     if logged_in?
        flash[:notice] ="You are already logged in"
        erb :'users/login'
     else
        redirect '/teams'
     end
    end
    

    post '/login' do 
        @user = User.find_by(:email => params[:email])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect '/teams'
            else
                erb :'users/signup'
        end
    end

    get '/logout' do 
        session.destroy
        redirect '/'
    end
end