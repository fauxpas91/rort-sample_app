require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "should be valid" do
    assert @user_model.valid?
  end
  
  test "name should be present" do
    @user_model.name = "  "
    assert_not @user_model.valid?
  end
  
  test "email should be present" do
    @user_model.email = "  "
    assert_not @user_model.valid?
  end
  
  test "name should not be too long" do
    @user_model.name = "a" * 101
    assert_not @user_model.valid?
  end
  
  test "email should not be too long" do
    @user_model.email = "a" * 244 + "@example.com"
    assert_not @user_model.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
            first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user_model.email = valid_address
      assert @user_model.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user_model.email = invalid_address
      assert_not @user_model.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "email addresses should be unique" do
    duplicate_user = @user_model.dup
    duplicate_user.email = @user_model.email.upcase
    @user_model.save
    assert_not duplicate_user.valid?
  end
  
  test "email addresses should be saved as lowercase" do
    mixed_case_email = "Foo@ExAMPLe.CoM"
    @user_model.email = mixed_case_email
    @user_model.save
    assert_equal mixed_case_email.downcase, @user_model.reload.email
  end
  
  test "password should be present (nonblank)" do
    @user_model.password = @user_model.password_confirmation = " " * 6
    assert_not @user_model.valid?
  end
  
  test "password should have a minimum length" do
    @user_model.password = @user_model.password_confirmation = "a" * 5
    assert_not @user_model.valid?
  end
  
end


