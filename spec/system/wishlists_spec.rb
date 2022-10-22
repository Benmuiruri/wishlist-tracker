require 'rails_helper'
require 'capybara/rails'

RSpec.describe 'Wishlists', type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario 'User creates a new wishlist' do
    visit wishlists_path
    click_link 'New Wishlist'
    fill_in 'Name', with: 'My Wishlist'
    click_button 'Create Wishlist'
    expect(page).to have_content('My Wishlist')
  end

  scenario 'Visiting the wishlist show page' do
    wishlist = create(:wishlist)
    visit wishlist_path(wishlist)
    expect(page).to have_content(wishlist.name)
  end
  scenario 'User edits a wishlist' do
    wishlist = create(:wishlist)
    visit edit_wishlist_path(wishlist)
    fill_in 'Name', with: 'My Updated Wishlist'
    click_button 'Update Wishlist'
    expect(page).to have_content('My Updated Wishlist')
  end

  scenario 'User deletes a wishlist' do
    wishlist = create(:wishlist)
    visit wishlists_path
    click_button 'Delete'
    expect(page).to_not have_content(wishlist.name)
  end
end
