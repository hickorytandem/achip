class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :consultations
  has_many :bookings
  has_one_attached :avatar
  has_many :bookings_as_mentor, through: :consultations, source: :bookings
  has_many :bookings_as_mentee, class_name: "Booking"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

