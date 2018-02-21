class User < ApplicationRecord
  has_many :manifests
  has_many :manifest_items , through: :manifests
  has_many :items , through: :manifest_items
  has_secure_password
end
