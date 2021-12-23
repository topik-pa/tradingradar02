require 'test_helper'

class FollowStockNewslettersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @follow_stock_newsletter = follow_stock_newsletters(:one)
  end

  test "should get index" do
    get follow_stock_newsletters_url
    assert_response :success
  end

  test "should get new" do
    get new_follow_stock_newsletter_url
    assert_response :success
  end

  test "should create follow_stock_newsletter" do
    assert_difference('FollowStockNewsletter.count') do
      post follow_stock_newsletters_url, params: { follow_stock_newsletter: { active: @follow_stock_newsletter.active, email: @follow_stock_newsletter.email, isin: @follow_stock_newsletter.isin, privacy: @follow_stock_newsletter.privacy, referrer: @follow_stock_newsletter.referrer, stock: @follow_stock_newsletter.stock } }
    end

    assert_redirected_to follow_stock_newsletter_url(FollowStockNewsletter.last)
  end

  test "should show follow_stock_newsletter" do
    get follow_stock_newsletter_url(@follow_stock_newsletter)
    assert_response :success
  end

  test "should get edit" do
    get edit_follow_stock_newsletter_url(@follow_stock_newsletter)
    assert_response :success
  end

  test "should update follow_stock_newsletter" do
    patch follow_stock_newsletter_url(@follow_stock_newsletter), params: { follow_stock_newsletter: { active: @follow_stock_newsletter.active, email: @follow_stock_newsletter.email, isin: @follow_stock_newsletter.isin, privacy: @follow_stock_newsletter.privacy, referrer: @follow_stock_newsletter.referrer, stock: @follow_stock_newsletter.stock } }
    assert_redirected_to follow_stock_newsletter_url(@follow_stock_newsletter)
  end

  test "should destroy follow_stock_newsletter" do
    assert_difference('FollowStockNewsletter.count', -1) do
      delete follow_stock_newsletter_url(@follow_stock_newsletter)
    end

    assert_redirected_to follow_stock_newsletters_url
  end
end
