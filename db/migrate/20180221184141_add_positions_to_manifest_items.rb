class AddPositionsToManifestItems < ActiveRecord::Migration[5.1]
  def change
    add_column :manifest_items, :left_position, :integer
    add_column :manifest_items, :top_position, :integer
  end
end
