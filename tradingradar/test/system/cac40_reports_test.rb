require "application_system_test_case"

class Cac40ReportsTest < ApplicationSystemTestCase
  setup do
    @cac40_report = cac40_reports(:one)
  end

  test "visiting the index" do
    visit cac40_reports_url
    assert_selector "h1", text: "Cac40 Reports"
  end

  test "creating a Cac40 report" do
    visit cac40_reports_url
    click_on "New Cac40 Report"

    fill_in "Abcbourse Consensus", with: @cac40_report.abcbourse_consensus
    fill_in "Abcbourse Tendency", with: @cac40_report.abcbourse_tendency
    fill_in "Boursefortuneo Rating", with: @cac40_report.boursefortuneo_rating
    fill_in "Boursefortuneo Resistance", with: @cac40_report.boursefortuneo_resistance
    fill_in "Boursefortuneo Support", with: @cac40_report.boursefortuneo_support
    fill_in "Boursefortuneo Target", with: @cac40_report.boursefortuneo_target
    fill_in "Boursefortuneo Trendmedium", with: @cac40_report.boursefortuneo_trendmedium
    fill_in "Boursefortuneo Trendshort", with: @cac40_report.boursefortuneo_trendshort
    fill_in "Boursefortuneo Volatility", with: @cac40_report.boursefortuneo_volatility
    fill_in "Isin", with: @cac40_report.isin
    fill_in "Lefigaro Consensus", with: @cac40_report.lefigaro_consensus
    fill_in "Stock", with: @cac40_report.stock
    fill_in "Tradingsat Trendlong", with: @cac40_report.tradingsat_trendlong
    fill_in "Tradingsat Trendmedium", with: @cac40_report.tradingsat_trendmedium
    fill_in "Tradingsat Trendshort", with: @cac40_report.tradingsat_trendshort
    fill_in "Zonebourse Resistance", with: @cac40_report.zonebourse_resistance
    fill_in "Zonebourse Support", with: @cac40_report.zonebourse_support
    fill_in "Zonebourse Trendlong", with: @cac40_report.zonebourse_trendlong
    fill_in "Zonebourse Trendmedium", with: @cac40_report.zonebourse_trendmedium
    fill_in "Zonebourse Trendshort", with: @cac40_report.zonebourse_trendshort
    click_on "Create Cac40 report"

    assert_text "Cac40 report was successfully created"
    click_on "Back"
  end

  test "updating a Cac40 report" do
    visit cac40_reports_url
    click_on "Edit", match: :first

    fill_in "Abcbourse Consensus", with: @cac40_report.abcbourse_consensus
    fill_in "Abcbourse Tendency", with: @cac40_report.abcbourse_tendency
    fill_in "Boursefortuneo Rating", with: @cac40_report.boursefortuneo_rating
    fill_in "Boursefortuneo Resistance", with: @cac40_report.boursefortuneo_resistance
    fill_in "Boursefortuneo Support", with: @cac40_report.boursefortuneo_support
    fill_in "Boursefortuneo Target", with: @cac40_report.boursefortuneo_target
    fill_in "Boursefortuneo Trendmedium", with: @cac40_report.boursefortuneo_trendmedium
    fill_in "Boursefortuneo Trendshort", with: @cac40_report.boursefortuneo_trendshort
    fill_in "Boursefortuneo Volatility", with: @cac40_report.boursefortuneo_volatility
    fill_in "Isin", with: @cac40_report.isin
    fill_in "Lefigaro Consensus", with: @cac40_report.lefigaro_consensus
    fill_in "Stock", with: @cac40_report.stock
    fill_in "Tradingsat Trendlong", with: @cac40_report.tradingsat_trendlong
    fill_in "Tradingsat Trendmedium", with: @cac40_report.tradingsat_trendmedium
    fill_in "Tradingsat Trendshort", with: @cac40_report.tradingsat_trendshort
    fill_in "Zonebourse Resistance", with: @cac40_report.zonebourse_resistance
    fill_in "Zonebourse Support", with: @cac40_report.zonebourse_support
    fill_in "Zonebourse Trendlong", with: @cac40_report.zonebourse_trendlong
    fill_in "Zonebourse Trendmedium", with: @cac40_report.zonebourse_trendmedium
    fill_in "Zonebourse Trendshort", with: @cac40_report.zonebourse_trendshort
    click_on "Update Cac40 report"

    assert_text "Cac40 report was successfully updated"
    click_on "Back"
  end

  test "destroying a Cac40 report" do
    visit cac40_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cac40 report was successfully destroyed"
  end
end
