require "application_system_test_case"

class FiasReportsTest < ApplicationSystemTestCase
  setup do
    @fias_report = fias_reports(:one)
  end

  test "visiting the index" do
    visit fias_reports_url
    assert_selector "h1", text: "Fias Reports"
  end

  test "creating a Fias report" do
    visit fias_reports_url
    click_on "New Fias Report"

    fill_in "Borsaitaliana Fta", with: @fias_report.borsaitaliana_fta
    fill_in "Borsaitaliana Resistance", with: @fias_report.borsaitaliana_resistance
    fill_in "Borsaitaliana Rsi", with: @fias_report.borsaitaliana_rsi
    fill_in "Borsaitaliana Support", with: @fias_report.borsaitaliana_support
    fill_in "Borsaitaliana Volatility", with: @fias_report.borsaitaliana_volatility
    fill_in "Isin", with: @fias_report.isin
    fill_in "Milanofinanza Rating", with: @fias_report.milanofinanza_rating
    fill_in "Milanofinanza Risk", with: @fias_report.milanofinanza_risk
    fill_in "Milanofinanza Trendlong", with: @fias_report.milanofinanza_trendlong
    fill_in "Milanofinanza Trendmedium", with: @fias_report.milanofinanza_trendmedium
    fill_in "Milanofinanza Trendshort", with: @fias_report.milanofinanza_trendshort
    fill_in "Sole24ore Fta", with: @fias_report.sole24ore_fta
    fill_in "Sole24ore Resistance", with: @fias_report.sole24ore_resistance
    fill_in "Sole24ore Rsi", with: @fias_report.sole24ore_rsi
    fill_in "Sole24ore Rsidiv", with: @fias_report.sole24ore_rsidiv
    fill_in "Sole24ore Shorttrend", with: @fias_report.sole24ore_shorttrend
    fill_in "Sole24ore Strategy", with: @fias_report.sole24ore_strategy
    fill_in "Sole24ore Support", with: @fias_report.sole24ore_support
    fill_in "Stock", with: @fias_report.stock
    fill_in "Teleborsa Resistance", with: @fias_report.teleborsa_resistance
    fill_in "Teleborsa Support", with: @fias_report.teleborsa_support
    click_on "Create Fias report"

    assert_text "Fias report was successfully created"
    click_on "Back"
  end

  test "updating a Fias report" do
    visit fias_reports_url
    click_on "Edit", match: :first

    fill_in "Borsaitaliana Fta", with: @fias_report.borsaitaliana_fta
    fill_in "Borsaitaliana Resistance", with: @fias_report.borsaitaliana_resistance
    fill_in "Borsaitaliana Rsi", with: @fias_report.borsaitaliana_rsi
    fill_in "Borsaitaliana Support", with: @fias_report.borsaitaliana_support
    fill_in "Borsaitaliana Volatility", with: @fias_report.borsaitaliana_volatility
    fill_in "Isin", with: @fias_report.isin
    fill_in "Milanofinanza Rating", with: @fias_report.milanofinanza_rating
    fill_in "Milanofinanza Risk", with: @fias_report.milanofinanza_risk
    fill_in "Milanofinanza Trendlong", with: @fias_report.milanofinanza_trendlong
    fill_in "Milanofinanza Trendmedium", with: @fias_report.milanofinanza_trendmedium
    fill_in "Milanofinanza Trendshort", with: @fias_report.milanofinanza_trendshort
    fill_in "Sole24ore Fta", with: @fias_report.sole24ore_fta
    fill_in "Sole24ore Resistance", with: @fias_report.sole24ore_resistance
    fill_in "Sole24ore Rsi", with: @fias_report.sole24ore_rsi
    fill_in "Sole24ore Rsidiv", with: @fias_report.sole24ore_rsidiv
    fill_in "Sole24ore Shorttrend", with: @fias_report.sole24ore_shorttrend
    fill_in "Sole24ore Strategy", with: @fias_report.sole24ore_strategy
    fill_in "Sole24ore Support", with: @fias_report.sole24ore_support
    fill_in "Stock", with: @fias_report.stock
    fill_in "Teleborsa Resistance", with: @fias_report.teleborsa_resistance
    fill_in "Teleborsa Support", with: @fias_report.teleborsa_support
    click_on "Update Fias report"

    assert_text "Fias report was successfully updated"
    click_on "Back"
  end

  test "destroying a Fias report" do
    visit fias_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fias report was successfully destroyed"
  end
end
