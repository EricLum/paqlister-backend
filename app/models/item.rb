class Item < ApplicationRecord
  has_many :manifest_items
  has_many :manifests, through: :manifest_items
end
