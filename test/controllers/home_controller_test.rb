require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  setup do
    @address = addresses(:default)
  end

  teardown do
    Rails.cache.clear
  end

  test "should get index" do
    get root_path
    assert_response :success
  end

  # @controller
  # @request
  # @response
  #
  # test "ajax request" do
  #   article = articles(:one)
  #   get article_url(article), xhr: true
  #
  #   assert_equal 'hello world', @response.body
  #   assert_equal "text/javascript", @response.content_type
  # end
end
