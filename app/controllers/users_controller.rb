class UsersController < ApplicationController
    
    get '/signup' do
        erb :'users/new'
    end


    post '/users' do 
    @user = User.new
        @user.email = params[:email]
        @user.password = params[:password]

            if @user.save
                redirect '/'
            else
                erb :'user/new'
         end
    end

    get '/login' do
        if logged_in?
            redirect '/teams'
        else 
            erb :'users/login'
        end
    end

    post '/login' do 
        @user = User.find_by(:email => params[:email])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect '/teams'
            else
                erb :'user/login'
            end
    
    end
end