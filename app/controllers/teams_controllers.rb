class TeamsController < ApplicationController
    before '/teams/*' do
        authentication_required
    end

    get '/teams' do
        if logged_in?
            @user = current_user
            @teams = @user.teams
            @others = Team.where('user_id != ?',  current_user.id)
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
         if !@team
            flash[:notice] = "You are not the current user of this team"
            redirect '/teams'
         else
        erb :'teams/show'
         end
    end

    post '/teams' do
        @team = current_user.teams.build(params)
       
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
            if !@team
                flash[:notice] = "You are not able to edit this team"
                redirect '/teams'
            else
        erb :'teams/edit'
            end
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