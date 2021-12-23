require 'test_helper'

class Dax30ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dax30_report = dax30_reports(:one)
    
    @update = {
      isin: 'DE000A1EWWW0',
      stock: 'Adidas',
      finanzen_rating: '3.5',
      finanzen_ratingmoodys: '5'
    } 
  end

  test "should get index" do
    get dax30_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_dax30_report_url
    assert_response :success
  end

  test "should create dax30_report" do
    assert_difference('Dax30Report.count') do
      post dax30_reports_url, params: { dax30_report: @update }
    end

    assert_redirected_to dax30_report_url(Dax30Report.last)
  end

  test "should show dax30_report" do
    get dax30_report_url(@dax30_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_dax30_report_url(@dax30_report)
    assert_response :success
  end

  test "should update dax30_report" do
    patch dax30_report_url(@dax30_report), params: { dax30_report: @update }
    assert_redirected_to dax30_report_url(@dax30_report)
  end

  test "should destroy dax30_report" do
    assert_difference('Dax30Report.count', -1) do
      delete dax30_report_url(@dax30_report)
    end

    assert_redirected_to dax30_reports_url
  end
end
