class CreateManifestItems < ActiveRecord::Migration[5.1]
  def change
    create_table :manifest_items do |t|
      t.integer :manifest_id
      t.integer :item_id
      t.timestamps
    end
  end
end
