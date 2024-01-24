require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should be valid with valid attributes" do
    user = User.new(email:"hello45@gmail.com",password:"4566@345",role:0)
    assert user.valid?
  end 

  test "should not be valid without email" do
    user = User.new(password:"87657HU*()",role:2)

    assert_not user.valid?
  end
end
