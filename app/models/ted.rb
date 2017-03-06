class Ted < ApplicationRecord

  belongs_to :user
  has_many :chapters, dependent: :destroy
  has_many :photos, through: :chapters
  has_attachment :avatar
  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  after_create :generate_code

  def distance_traveled
    distance_traveled = 0
    chapters.all.each_cons(2) do |chapters|
      distance_traveled += chapters.last.distance_from(chapters.first)
    end
    distance_traveled
  end

  private

  def generate_code
    self.code = SecureRandom.hex(6) + "fr"
  end

end
