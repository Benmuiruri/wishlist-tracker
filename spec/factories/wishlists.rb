# This will guess the Wishlist class

FactoryBot.define do
  sequence :name do |n|
    "My Wishlist #{n}"
  end
end
