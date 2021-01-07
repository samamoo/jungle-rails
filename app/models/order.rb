class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  # validate empty

  # def empty
  #   if !line_items.present?
  #     errors.add(:base, :invalid, message: "Your cart cannot be empty!")
  # end
end
