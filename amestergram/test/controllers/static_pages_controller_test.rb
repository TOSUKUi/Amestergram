require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  title = "Ruby on Rails Tutorial Sample App"

  test "should get home" do
    get static_pages_home_url
    assert_select "title", "Home | #{title}"
    assert_response :success
  end

  test "should get help" do
    get static_pages_help_url
    assert_select "title", "Help | #{title}"
    assert_response :success
  end

  test "should get about" do
    get static_pages_about_url
    assert_select "title", "About | #{title}"
    assert_response :success
  end

end
