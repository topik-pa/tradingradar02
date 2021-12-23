require "application_system_test_case"

class FollowStockNewslettersTest < ApplicationSystemTestCase
  setup do
    @follow_stock_newsletter = follow_stock_newsletters(:one)
  end

  test "visiting the index" do
    visit follow_stock_newsletters_url
    assert_selector "h1", text: "Follow Stock Newsletters"
  end

  test "creating a Follow stock newsletter" do
    visit follow_stock_newsletters_url
    click_on "New Follow Stock Newsletter"

    fill_in "Active", with: @follow_stock_newsletter.active
    fill_in "Email", with: @follow_stock_newsletter.email
    fill_in "Isin", with: @follow_stock_newsletter.isin
    fill_in "Privacy", with: @follow_stock_newsletter.privacy
    fill_in "Referrer", with: @follow_stock_newsletter.referrer
    fill_in "Stock", with: @follow_stock_newsletter.stock
    click_on "Create Follow stock newsletter"

    assert_text "Follow stock newsletter was successfully created"
    click_on "Back"
  end

  test "updating a Follow stock newsletter" do
    visit follow_stock_newsletters_url
    click_on "Edit", match: :first

    fill_in "Active", with: @follow_stock_newsletter.active
    fill_in "Email", with: @follow_stock_newsletter.email
    fill_in "Isin", with: @follow_stock_newsletter.isin
    fill_in "Privacy", with: @follow_stock_newsletter.privacy
    fill_in "Referrer", with: @follow_stock_newsletter.referrer
    fill_in "Stock", with: @follow_stock_newsletter.stock
    click_on "Update Follow stock newsletter"

    assert_text "Follow stock newsletter was successfully updated"
    click_on "Back"
  end

  test "destroying a Follow stock newsletter" do
    visit follow_stock_newsletters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Follow stock newsletter was successfully destroyed"
  end
end
