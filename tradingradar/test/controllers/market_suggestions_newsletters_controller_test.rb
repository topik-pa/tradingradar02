require 'test_helper'

class MarketSuggestionsNewslettersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @market_suggestions_newsletter = market_suggestions_newsletters(:one)
  end

  test "should get index" do
    get market_suggestions_newsletters_url
    assert_response :success
  end

  test "should get new" do
    get new_market_suggestions_newsletter_url
    assert_response :success
  end

  test "should create market_suggestions_newsletter" do
    assert_difference('MarketSuggestionsNewsletter.count') do
      post market_suggestions_newsletters_url, params: { market_suggestions_newsletter: { active: @market_suggestions_newsletter.active, email: @market_suggestions_newsletter.email, privacy: @market_suggestions_newsletter.privacy, referrer: @market_suggestions_newsletter.referrer } }
    end

    assert_redirected_to market_suggestions_newsletter_url(MarketSuggestionsNewsletter.last)
  end

  test "should show market_suggestions_newsletter" do
    get market_suggestions_newsletter_url(@market_suggestions_newsletter)
    assert_response :success
  end

  test "should get edit" do
    get edit_market_suggestions_newsletter_url(@market_suggestions_newsletter)
    assert_response :success
  end

  test "should update market_suggestions_newsletter" do
    patch market_suggestions_newsletter_url(@market_suggestions_newsletter), params: { market_suggestions_newsletter: { active: @market_suggestions_newsletter.active, email: @market_suggestions_newsletter.email, privacy: @market_suggestions_newsletter.privacy, referrer: @market_suggestions_newsletter.referrer } }
    assert_redirected_to market_suggestions_newsletter_url(@market_suggestions_newsletter)
  end

  test "should destroy market_suggestions_newsletter" do
    assert_difference('MarketSuggestionsNewsletter.count', -1) do
      delete market_suggestions_newsletter_url(@market_suggestions_newsletter)
    end

    assert_redirected_to market_suggestions_newsletters_url
  end
end
