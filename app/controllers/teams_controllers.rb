class TeamsController < ApplicationController
    before '/teams/*' do
        authentication_required
    end

    get '/teams' do
        @teams = current_user.teams
        erb :'teams/index'
    end

    get '/teams/new' do
        erb :'teams/new'
    end

    get '/teams/:id' do
        @team = current_user.teams.find(params[:id])
        erb :'teams/show'
    end

    post '/teams' do
        @team = Team.new
        @team.name = params[:name]
        @team.platform = params[:platform]
        @team.user = current_user
         if @team.save
             redirect "/teams/#{@team.id}"
         else
            erb :'teams/new'
         end
    end

    post '/teams/:id/players' do
        @team = current_user.teams.find(params[:id])
        @player = @team.players.build(:gamertag => params[:gamertag])
        if @player.save
            redirect "/teams/#{@team.id}"
        else
         erb :"teams/show"
        end
    end
    
    
end