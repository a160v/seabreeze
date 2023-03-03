class Booking < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :boat

  validate :check_in_in_future
  validate :check_out_after_check_in

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

  def check_in_in_future
      if check_in.present? && check_in < Date.today
      errors.add(:check_in, "must be in future")
      end
  end

  def check_out_after_check_in
      if check_out.present? && check_out <= Date.today
      errors.add(:check_out, "must be in future")
    end
  end
end
