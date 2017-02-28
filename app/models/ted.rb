class Ted < ApplicationRecord
  belongs_to :user
  has_many :chapters, dependent: :destroy
  has_many :photos, through: :chapters
end
