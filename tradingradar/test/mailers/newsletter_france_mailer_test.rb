require 'test_helper'

class NewsletterFranceMailerTest < ActionMailer::TestCase
  test "stock" do
    mail = NewsletterFranceMailer.stock
    assert_equal "Stock", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "market" do
    mail = NewsletterFranceMailer.market
    assert_equal "Market", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
