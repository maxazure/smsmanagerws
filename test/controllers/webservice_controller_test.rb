require 'test_helper'

class WebserviceControllerTest < ActionDispatch::IntegrationTest
  test "should get getphone" do
    get webservice_getphone_url
    assert_response :success
  end

  test "should get report" do
    get webservice_report_url
    assert_response :success
  end

end
