require "application_system_test_case"

class UserReportsTest < ApplicationSystemTestCase
  setup do
    @user_report = user_reports(:one)
  end

  test "visiting the index" do
    visit user_reports_url
    assert_selector "h1", text: "User Reports"
  end

  test "creating a User report" do
    visit user_reports_url
    click_on "New User Report"

    fill_in "Buy", with: @user_report.buy
    fill_in "Isin", with: @user_report.isin
    fill_in "Note", with: @user_report.note
    fill_in "Rating", with: @user_report.rating
    fill_in "Resistance", with: @user_report.resistance
    fill_in "Sell", with: @user_report.sell
    fill_in "Sl", with: @user_report.sl
    fill_in "Stock", with: @user_report.stock
    fill_in "Support", with: @user_report.support
    fill_in "Trendlong", with: @user_report.trendlong
    fill_in "Trendmedium", with: @user_report.trendmedium
    fill_in "Trendshort", with: @user_report.trendshort
    click_on "Create User report"

    assert_text "User report was successfully created"
    click_on "Back"
  end

  test "updating a User report" do
    visit user_reports_url
    click_on "Edit", match: :first

    fill_in "Buy", with: @user_report.buy
    fill_in "Isin", with: @user_report.isin
    fill_in "Note", with: @user_report.note
    fill_in "Rating", with: @user_report.rating
    fill_in "Resistance", with: @user_report.resistance
    fill_in "Sell", with: @user_report.sell
    fill_in "Sl", with: @user_report.sl
    fill_in "Stock", with: @user_report.stock
    fill_in "Support", with: @user_report.support
    fill_in "Trendlong", with: @user_report.trendlong
    fill_in "Trendmedium", with: @user_report.trendmedium
    fill_in "Trendshort", with: @user_report.trendshort
    click_on "Update User report"

    assert_text "User report was successfully updated"
    click_on "Back"
  end

  test "destroying a User report" do
    visit user_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User report was successfully destroyed"
  end
end
