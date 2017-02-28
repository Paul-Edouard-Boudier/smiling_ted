class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :chapters
  has_many :teds
  has_many :photos, through: :chapters
  has_attachment  :avatar, accept: [:jpg, :png, :gif]
  has_attachments :photos, maximum: 5


end
