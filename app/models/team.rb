class Teams < ActiveRecord::Base
    belongs_to :user
    has_many :players
    has_many :platforms
end