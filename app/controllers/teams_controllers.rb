class TeamsController < ApplicationController

    get '/teams' do 
        @user = current_user
        @teams = @user.teams.all
        erb :'teams/index'
    end
    
end