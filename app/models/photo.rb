class Photo < ApplicationRecord
  belongs_to :chapter
  has_attachment :photos
end
