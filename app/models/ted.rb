class Ted < ApplicationRecord
  before_save :generate_code


  belongs_to :user
  has_many :chapters, dependent: :destroy
  has_many :photos, through: :chapters
  has_attachment :avatar

  private

  def generate_code
    self.code = SecureRandom.hex(6) + "fr"
  end

end
