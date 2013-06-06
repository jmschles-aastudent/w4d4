class AddBonusAndLyricsToTracks < ActiveRecord::Migration
  def change
  	add_column :tracks, :lyrics, :text
  	add_column :tracks, :bonus, :boolean
  end
end
