class TeamsController < ApplicationController
    before '/teams/*' do
        authentication_required
    end

    get '/teams/new' do
        erb :'teams/new'
    end

    
    
end