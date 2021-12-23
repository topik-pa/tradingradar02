require 'test_helper'

class FiasReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fias_report = fias_reports(:one)
    
    @update = {
      isin: 'IT0001233417',
      stock: 'A2a',
      borsaitaliana_support: '0.566',
      borsaitaliana_resistance: '0.788'
    }  
  end

  test "should get index" do
    get fias_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_fias_report_url
    assert_response :success
  end

  test "should create fias_report" do
    assert_difference('FiasReport.count') do
      post fias_reports_url, params: { fias_report: @update }
    end

    assert_redirected_to fias_report_url(FiasReport.last)
  end

  test "should show fias_report" do
    get fias_report_url(@fias_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_fias_report_url(@fias_report)
    assert_response :success
  end

  test "should update fias_report" do
    patch fias_report_url(@fias_report), params: { fias_report: @update }
    assert_redirected_to fias_report_url(@fias_report)
  end

  test "should destroy fias_report" do
    assert_difference('FiasReport.count', -1) do
      delete fias_report_url(@fias_report)
    end

    assert_redirected_to fias_reports_url
  end
end
