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
        redirect '/'
     else
        erb :'users/login'
     end
    end
    

    post '/login' do 
        @user = User.find_by(:email => params[:email])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect '/'
            else
                erb :'users/login'
        end
    end

    get '/logout' do 
        session.destroy
        redirect '/'
    end
end