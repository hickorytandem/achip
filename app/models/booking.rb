class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :consultation
  validates :date_time, presence: true
  enum status: { pending: 0, accept: 1, decline: 2 }

end
