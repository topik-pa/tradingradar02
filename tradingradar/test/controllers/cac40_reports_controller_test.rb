require 'test_helper'

class Cac40ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cac40_report = cac40_reports(:one)
    
    @update = {
      isin: 'FR0000120172',
      stock: 'Carrefour',
      tradingsat_trendshort: 'Up',
      tradingsat_trendmedium: 'Down',
      tradingsat_trendlong: 'Up'
    } 
  end

  test "should get index" do
    get cac40_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_cac40_report_url
    assert_response :success
  end

  test "should create cac40_report" do
    assert_difference('Cac40Report.count') do
      post cac40_reports_url, params: { cac40_report: @update }
    end

    assert_redirected_to cac40_report_url(Cac40Report.last)
  end

  test "should show cac40_report" do
    get cac40_report_url(@cac40_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_cac40_report_url(@cac40_report)
    assert_response :success
  end

  test "should update cac40_report" do
    patch cac40_report_url(@cac40_report), params: { cac40_report: @update }
    assert_redirected_to cac40_report_url(@cac40_report)
  end

  test "should destroy cac40_report" do
    assert_difference('Cac40Report.count', -1) do
      delete cac40_report_url(@cac40_report)
    end

    assert_redirected_to cac40_reports_url
  end
end
