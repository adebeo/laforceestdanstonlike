class AddCheckinsCountToSite < ActiveRecord::Migration[5.0]
  def change
    add_column :sites, :checkins_count, :integer, default: 0
  end
end
