class Chapter < ApplicationRecord
  belongs_to :user
  belongs_to :ted
  has_many :photos, dependent: :destroy
  geocoded_by :localisation
  after_validation :geocode, if: :localisation_changed?

  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true
  after_create :update_ted_location

  def update_ted_location
    self.ted.location = self.localisation
    self.ted.save
  end
end
