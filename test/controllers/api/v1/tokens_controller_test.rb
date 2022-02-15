require "test_helper"

class Api::V1::TokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = user(:one)
  end

  test 'should get JWT token' do 
    post api_v1_token_url, params: { user: {email:@user.email , password:'hdidndi@'}}, as: :json
    assert_response :success

    json_response = JSON.parse(responce.body)
    assert_not_nil json_response['token']
  end

  test 'shoud not get JWT token' do
    post api_v1_token_url, params: { user: {email:@user.email, password:'rww'}}, as: :json
    assert_response :unauthorized
  end

end
