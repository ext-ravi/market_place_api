require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "email must have @" do
    user = User.new(email:"xyz@gmail.com", password_digest:"buv")
    assert user.valid?
  end
end
