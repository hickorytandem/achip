class Consultation < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :title, :price, :duration, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    associated_against: {
      user: [ :name ]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
