class CreateManifests < ActiveRecord::Migration[5.1]
  def change
    create_table :manifests do |t|
      t.string :title
      t.string :limit
      t.string :description
      t.integer :user_id
      t.timestamps
    end
  end
end
