require 'rails_helper'
require 'capybara/rails'

RSpec.describe 'Wishlists', type: :system do
  before do
    driven_by(:rack_test)
    wishlist = create(:wishlist)
  end

  scenario 'Visiting the wishlist show page' do
    visit wishlist_path(wishlist)
    expect(page).to have_content(wishlist.name)
  end

  scenario 'User creates a new wishlist' do
    visit wishlists_path
    expect(page).to have_content('Wishlists')

    click_link 'New Wishlist'
    fill_in 'Name', with: 'My Wishlist'
    expect(page).to have_content('Wishlists')

    click_button 'Create Wishlist'
    expect(page).to have_content('My Wishlist')
  end

  scenario 'User edits a wishlist' do
    visit wishlists_path
    expect(page).to have_content('My Wishlist')

    visit edit_wishlist_path(wishlist)
    fill_in 'Name', with: 'My Updated Wishlist'
    expect(page).to have_content('My Wishlist')

    click_button 'Update Wishlist'
    expect(page).to have_content('My Updated Wishlist')
  end

  scenario 'User deletes a wishlist' do
    visit wishlists_path
    click_button 'Delete'
    expect(page).to_not have_content(wishlist.name)
  end
end
