class RenameCampaignInGames < ActiveRecord::Migration[6.1]
  def change
    rename_column :games, :campaign?, :campaign
  end
end
