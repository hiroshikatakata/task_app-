class Room < ApplicationRecord
  belongs_to :sign
  has_many :reservations

  mount_uploader :icon, IconUploader
  validates :name,    length: { minimum: 1 }
  validates :introduction, presence: true
  validates :introduction,    length: { maximum: 50 }
  validates :icon, presence: true
  validate :pretend_ago_start, on: :update
  validate :pretend_ago_end_day, on: :update
  validate :start_end_check, on: :update
  validates :number, presence: true, on: :update
  validates :number, numericality: { only_integer: true }, on: :update
  validates :address, presence: true
  validates :price, presence: true

  def pretend_ago_start
    errors.add(:start_date, "は今日以降を選択する必要があります") if start_date.nil? || start_date < Date.today
  end
  def pretend_ago_end_day
    errors.add(:end_date, "は今日以降を選択する必要があります") if end_date.nil? || end_date < Date.today
  end
  def start_end_check
    errors.add(:end_date, "は開始日より前の日付は指定できません。") unless
    self.start_date < self.end_date || self.start_date = self.end_date
  end
end
