require "test_helper"

class SignUpMailerTest < ActionMailer::TestCase
  test "success" do
    mail = SignUpMailer.success
    assert_equal "Success", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
