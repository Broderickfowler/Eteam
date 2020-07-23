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
        @team.user = current_user
         if @team.save
             redirect '/teams'
         else
            erb :'teams/new'
         end
    end
    
    
end