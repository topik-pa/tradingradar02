require 'test_helper'

class ServerErrorOccurredMailerTest < ActionMailer::TestCase
  test "generic" do
    mail = ServerErrorOccurredMailer.generic
    assert_equal "Generic", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
