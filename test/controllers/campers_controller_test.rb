require "test_helper"

class CampersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get campers_show_url
    assert_response :success
  end

  test "should get edit" do
    get campers_edit_url
    assert_response :success
  end
end
