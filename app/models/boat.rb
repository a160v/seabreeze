class Boat < ApplicationRecord
  include PgSearch::Model
  belongs_to :user, dependent: :destroy
  has_many :bookings
  has_one_attached :photo

  # Global search; NOTA BENE: email is exposed for educational purposes.
  pg_search_scope :global_search,
  against: %i[title price_per_day type description capacity address manufacturing_year],
  associated_against: { user: [:email] },
  using: { tsearch: { prefix: true } }
end
