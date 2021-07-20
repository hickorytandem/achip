class Consultation < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :title, :price, :duration, presence: true
end
