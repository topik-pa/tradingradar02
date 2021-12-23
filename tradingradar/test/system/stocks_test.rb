require "application_system_test_case"

class StocksTest < ApplicationSystemTestCase
  setup do
    @stock = stocks(:one)
  end

  test "visiting the index" do
    visit stocks_url
    assert_selector "h1", text: "Stocks"
  end

  test "creating a Stock" do
    visit stocks_url
    click_on "New Stock"

    fill_in "Address", with: @stock.address
    fill_in "Corporate Url", with: @stock.corporate_url
    fill_in "Currency", with: @stock.currency
    fill_in "Dividend", with: @stock.dividend
    fill_in "Dividend Date", with: @stock.dividend_date
    fill_in "Dividend Yeld", with: @stock.dividend_yeld
    fill_in "Isin", with: @stock.isin
    fill_in "Keywords", with: @stock.keywords
    fill_in "Last Price", with: @stock.last_price
    fill_in "Market", with: @stock.market
    fill_in "Market Phase", with: @stock.market_phase
    fill_in "Name", with: @stock.name
    fill_in "Performance1", with: @stock.performance1
    fill_in "Performance12", with: @stock.performance12
    fill_in "Performance6", with: @stock.performance6
    fill_in "Phone", with: @stock.phone
    fill_in "Profile", with: @stock.profile
    fill_in "Reuters", with: @stock.reuters
    fill_in "Sector", with: @stock.sector
    fill_in "Variation", with: @stock.variation
    click_on "Create Stock"

    assert_text "Stock was successfully created"
    click_on "Back"
  end

  test "updating a Stock" do
    visit stocks_url
    click_on "Edit", match: :first

    fill_in "Address", with: @stock.address
    fill_in "Corporate Url", with: @stock.corporate_url
    fill_in "Currency", with: @stock.currency
    fill_in "Dividend", with: @stock.dividend
    fill_in "Dividend Date", with: @stock.dividend_date
    fill_in "Dividend Yeld", with: @stock.dividend_yeld
    fill_in "Isin", with: @stock.isin
    fill_in "Keywords", with: @stock.keywords
    fill_in "Last Price", with: @stock.last_price
    fill_in "Market", with: @stock.market
    fill_in "Market Phase", with: @stock.market_phase
    fill_in "Name", with: @stock.name
    fill_in "Performance1", with: @stock.performance1
    fill_in "Performance12", with: @stock.performance12
    fill_in "Performance6", with: @stock.performance6
    fill_in "Phone", with: @stock.phone
    fill_in "Profile", with: @stock.profile
    fill_in "Reuters", with: @stock.reuters
    fill_in "Sector", with: @stock.sector
    fill_in "Variation", with: @stock.variation
    click_on "Update Stock"

    assert_text "Stock was successfully updated"
    click_on "Back"
  end

  test "destroying a Stock" do
    visit stocks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stock was successfully destroyed"
  end
end
