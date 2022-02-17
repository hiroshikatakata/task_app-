class Sign < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :icon, IconUploader

  has_many :rooms, dependent: :destroy
  has_many :reservations
  has_many :reservation_rooms, through: :reservations, source: :room
  validates :name, presence: true, on: :update

  validates :introduction, presence: true, on: :update
  validates :introduction,    length: { maximum: 50 }


end
