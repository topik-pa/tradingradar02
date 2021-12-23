require 'test_helper'

class NewsletterMailerTest < ActionMailer::TestCase
  test "market" do
    mail = NewsletterMailer.market
    assert_equal "Market", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "stock" do
    mail = NewsletterMailer.stock
    assert_equal "Stock", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
