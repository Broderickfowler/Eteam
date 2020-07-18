class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :team_id
      t.string :name
      t.string :gamertag
    end
  end
end
