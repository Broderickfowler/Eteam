User Functionality
/signup
/login
/logout


1. Plan Application
    User 
        Authentication
        Email/Password 
        Unique Emails
        Many Teams

    Teams
        has_many :players
        has_many :platforms

    Teams
        Id              Name            Platform        User_id
        1               Wings             Xbox              1

        Teams Routes
            /Teams => shows all teams
            /teams/new => create new team
            /teams/:id => shows selected :team_id
            
            /teams/:id/edit => edit :team_id
            /teams/:id/delete => delete :team_id

           
            
    ----------------------------------------------------------------------

    Players
    belongs_to :teams

    Players
        Team_id           Name          Gamertag          
          1              William        Deadshot

            Routes
              /teams/:id/players => Players Resources
              add players
              edit players



    ----------------------------------------------------------------------
    


    -- Improvements to Corneal

    1. removed env requirement from application controller
    2. removed databas cleaner
    3. unlocked all gem versions
    4. removed thin