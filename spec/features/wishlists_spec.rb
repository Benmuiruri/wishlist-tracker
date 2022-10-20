require 'rails_helper'

RSpec.feature "Wishlists", type: :feature do
 scenario "User creates a new wishlist" do
    visit root_path
    click_link "New Wishlist"
    fill_in "Name", with: "My Wishlist"
    click_button "Create Wishlist"
    expect(page).to have_content("My Wishlist")
  end
end
