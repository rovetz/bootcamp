class Product < ActiveRecord::Base
  monetize :price_cents, as: :price
  monetize :amount_cents, as: :amount

  validates :name, :price, :amount, presence: true
  validates :price, :amount, numericality: true

  scope :inserted_by_month, lambda { |date| where(created_at: (date.beginning_of_month..date.end_of_month)) }

  def full_price
    amount * 1.1
  end

end
