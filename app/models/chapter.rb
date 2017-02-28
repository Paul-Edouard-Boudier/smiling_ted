class Chapter < ApplicationRecord
  belongs_to :user
  belongs_to :ted
  has_many :photos, dependent: :destroy
end
