class ManifestItem < ApplicationRecord
  belongs_to :item
  belongs_to :manifest
end
