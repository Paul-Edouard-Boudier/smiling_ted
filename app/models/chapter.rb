class Chapter < ApplicationRecord
  belongs_to :user
  belongs_to :ted
  has_many :photos, dependent: :destroy
  geocoded_by :full_address
  after_validation :geocode, if: :full_address_changed?

  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true
  after_create :update_ted_location

  validates :country, presence: true

  def update_ted_location
    self.ted.location = self.localisation
    self.ted.save
  end

  def full_address
    [localisation, country].compact.join(', ')
  end

  def full_address_changed?
    localisation_changed? || country_changed?
  end
end
