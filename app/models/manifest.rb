class Manifest < ApplicationRecord
  belongs_to :user
  has_many :manifest_items
  has_many :items ,through: :manifest_items
end
