class Ted < ApplicationRecord
  CODES = ["123127FR", "638253FR", "197304EN", "283690FR", "739541FR", "884541EN", "117454EN", "464254FR", "117468FR", "478643EN"]

  belongs_to :user
  has_many :chapters, dependent: :destroy
  has_many :photos, through: :chapters
  has_attachment :avatar

  validates :code, presence: true, inclusion: { in: CODES }

end
