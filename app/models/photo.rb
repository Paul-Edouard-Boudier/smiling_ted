class Photo < ApplicationRecord
  belongs_to :chapter
  has_attachment :image
end
