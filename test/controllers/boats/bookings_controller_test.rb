require "test_helper"

class Boats::BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get boats_bookings_index_url
    assert_response :success
  end
end
