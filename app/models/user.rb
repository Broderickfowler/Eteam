class User < Activerecord::Base
    has_secure_password
    has_many :teams
end