require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  # ユーザー登録失敗テスト
  test "invalid signup information" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path,params:{user:{
        name:'',email:"user@invalid",password:"foo",
        password_confirmation: "bar"
        }}
    end
    assert_template 'users/new'
  end

  # ユーザー登録成功テスト
  test "valid signup information" do
    get new_user_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: {
        name:  "Example User", email: "user@example.com",
        password:"password",password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
  end

end
