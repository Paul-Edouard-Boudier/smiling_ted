class Chapter < ApplicationRecord
  belongs_to :user
  belongs_to :ted
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true
end
