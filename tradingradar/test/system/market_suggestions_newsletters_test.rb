require "application_system_test_case"

class MarketSuggestionsNewslettersTest < ApplicationSystemTestCase
  setup do
    @market_suggestions_newsletter = market_suggestions_newsletters(:one)
  end

  test "visiting the index" do
    visit market_suggestions_newsletters_url
    assert_selector "h1", text: "Market Suggestions Newsletters"
  end

  test "creating a Market suggestions newsletter" do
    visit market_suggestions_newsletters_url
    click_on "New Market Suggestions Newsletter"

    fill_in "Active", with: @market_suggestions_newsletter.active
    fill_in "Email", with: @market_suggestions_newsletter.email
    fill_in "Privacy", with: @market_suggestions_newsletter.privacy
    fill_in "Referrer", with: @market_suggestions_newsletter.referrer
    click_on "Create Market suggestions newsletter"

    assert_text "Market suggestions newsletter was successfully created"
    click_on "Back"
  end

  test "updating a Market suggestions newsletter" do
    visit market_suggestions_newsletters_url
    click_on "Edit", match: :first

    fill_in "Active", with: @market_suggestions_newsletter.active
    fill_in "Email", with: @market_suggestions_newsletter.email
    fill_in "Privacy", with: @market_suggestions_newsletter.privacy
    fill_in "Referrer", with: @market_suggestions_newsletter.referrer
    click_on "Update Market suggestions newsletter"

    assert_text "Market suggestions newsletter was successfully updated"
    click_on "Back"
  end

  test "destroying a Market suggestions newsletter" do
    visit market_suggestions_newsletters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Market suggestions newsletter was successfully destroyed"
  end
end
