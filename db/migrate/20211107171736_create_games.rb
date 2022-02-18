class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title
      t.string :system
      t.text :description
      t.integer :min_players
      t.integer :max_players
      t.string :pref_when
      t.text :desired_players
      t.string :campaign?
      t.numeric :game_duration_hours

      t.timestamps
    end
  end
end
