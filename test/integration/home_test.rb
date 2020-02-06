require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest
  test "can see root path" do
    get root_url
    assert_response :success

    # post "/articles", params: {
    #     article: {
    #         title: "can create", body: "article successfully."
    #     }
    # }
    # assert_response :redirect
    # follow_redirect!
    # assert_response :success
    # assert_select "p", "Title:\n  can create"
  end
end
