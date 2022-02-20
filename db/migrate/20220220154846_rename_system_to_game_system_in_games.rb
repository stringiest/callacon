class RenameSystemToGameSystemInGames < ActiveRecord::Migration[6.1]
  def change
    rename_column :games, :system, :game_system
  end
end
