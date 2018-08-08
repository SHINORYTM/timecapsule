require 'test_helper'

class ImageControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get image_create_url
    assert_response :success
  end

end
