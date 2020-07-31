class TeamsController < ApplicationController
    before '/teams/*' do
        authentication_required
    end

    get '/teams' do
        if logged_in?
            @user = current_user
            @teams = @user.teams.all
            erb :'teams/index'
        else
            redirect '/login'
        end
    end

    get '/teams/new' do
        erb :'teams/new'
    end

    get '/teams/:id' do
        @team = current_user.teams.find_by_id(params[:id])
        
        erb :'teams/show'
    end

    post '/teams' do
        @team = Team.new
        @team.name = params[:name]
        @team.platform = params[:platform]
        @team.user = current_user
        current_user.teams << @team
         if @team.save
             redirect "/teams/#{@team.id}"
         else
            erb :'teams/new'
         end
    end

    post '/teams/:id/players' do
        @team = current_user.teams.find_by_id(params[:id])
        @player = @team.players.build(:gamertag => params[:gamertag])
        
        if @player.save
            redirect "/teams/#{@team.id}"
        else
         erb :"teams/show"
        end
    end
    

    get '/teams/:id/edit' do
        @team = current_user.teams.find_by_id(params[:id])
        erb :'teams/edit'
    end
    
    patch '/teams/:id' do
        @team = Team.find_by_id(params[:id])
        @team.update(params[:team])
            redirect "/teams/#{@team.id}"
        
    end

    delete '/teams/:id/delete' do
        if logged_in?
            @team = current_user.teams.find_by_id(params[:id])
            @team.delete
            redirect '/teams'
        else
            redirect to '/login'
        end
    end
    
end