class Product < ActiveRecord::Base

  validates :name, :price, :amount, presence: true
  validates :price, :amount, numericality: true

  scope :inserted_by_month, lambda { |date| where(created_at: (date.beginning_of_month..date.end_of_month)) }

  def full_price
    amount * 1.1
  end

end
