class Wishlist < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }
end
