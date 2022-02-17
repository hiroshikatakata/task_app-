class Reservation < ApplicationRecord
  belongs_to :sign
  belongs_to :room
  mount_uploader :icon, IconUploader
end
