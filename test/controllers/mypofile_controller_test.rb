require 'test_helper'

class MypofileControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mypofile_index_url
    assert_response :success
  end

  test "should get update" do
    get mypofile_update_url
    assert_response :success
  end

end
