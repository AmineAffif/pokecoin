require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get add_money" do
    get users_add_money_url
    assert_response :success
  end

  test "should get deposit_money" do
    get users_deposit_money_url
    assert_response :success
  end

  test "should get transactions" do
    get users_transactions_url
    assert_response :success
  end
end
