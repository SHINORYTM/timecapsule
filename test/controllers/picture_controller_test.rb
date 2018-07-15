require 'test_helper'

class PictureControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get picture_create_url
    assert_response :success
  end

end
