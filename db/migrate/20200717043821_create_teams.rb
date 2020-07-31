class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :user_id
      t.string :name
      t.string :platform
    end
  end
end
