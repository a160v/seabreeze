class Booking < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :boat,
end
