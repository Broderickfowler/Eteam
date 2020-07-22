class TeamsController < ApplicationController

    get '/teams' do 
        @user = current_user
        @teams = @user.teams.all
        erb :'teams/index'
    end

    get '/teams/new' do 
        erb :'teams/new'
    end
    
end