require 'test_helper'

class BookCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get book_comments_edit_url
    assert_response :success
  end

end
