require "application_system_test_case"

class Dax30ReportsTest < ApplicationSystemTestCase
  setup do
    @dax30_report = dax30_reports(:one)
  end

  test "visiting the index" do
    visit dax30_reports_url
    assert_selector "h1", text: "Dax30 Reports"
  end

  test "creating a Dax30 report" do
    visit dax30_reports_url
    click_on "New Dax30 Report"

    fill_in "Finanzen Rating", with: @dax30_report.finanzen_rating
    fill_in "Finanzen Ratingmoodys", with: @dax30_report.finanzen_ratingmoodys
    fill_in "Finanzen Sentiment", with: @dax30_report.finanzen_sentiment
    fill_in "Isin", with: @dax30_report.isin
    fill_in "Stock", with: @dax30_report.stock
    click_on "Create Dax30 report"

    assert_text "Dax30 report was successfully created"
    click_on "Back"
  end

  test "updating a Dax30 report" do
    visit dax30_reports_url
    click_on "Edit", match: :first

    fill_in "Finanzen Rating", with: @dax30_report.finanzen_rating
    fill_in "Finanzen Ratingmoodys", with: @dax30_report.finanzen_ratingmoodys
    fill_in "Finanzen Sentiment", with: @dax30_report.finanzen_sentiment
    fill_in "Isin", with: @dax30_report.isin
    fill_in "Stock", with: @dax30_report.stock
    click_on "Update Dax30 report"

    assert_text "Dax30 report was successfully updated"
    click_on "Back"
  end

  test "destroying a Dax30 report" do
    visit dax30_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dax30 report was successfully destroyed"
  end
end
