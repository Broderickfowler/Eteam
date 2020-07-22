class TeamsController < ApplicationController

    get '/teams' do 
        @user = current_user
        @teams = @user.teams.all
        erb :'teams/index'
    end

    get '/teams/new' do 
        erb :'teams/new'
    end

    #get '/teams/:id' do 
       # @team = current_user.teams.find

    post '/teams' do
        @team = Team.new
        @team.name = params[:name]
        @team.user = current_user

        if @team.save
            redirect '/teams'
        else
            erb :"teams/new."
        end
    end
    
end