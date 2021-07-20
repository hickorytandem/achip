class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :consultation
  validates :date_time, presence: true
end
