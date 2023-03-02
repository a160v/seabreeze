class Booking < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :boat

  # enum status: [:pending, :accepted, :rejected]
  enum status: { pending: "pending", accepted: "accepted", rejected: "rejected" }

  def pending
    self.status = :pending
    self.save!
  end

  def accept!
    self.status = :accepted
    self.save!
  end

  def reject!
    self.status = :rejected
    self.save!
  end
end
