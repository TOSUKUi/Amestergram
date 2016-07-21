require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  title = "Ruby on Rails Tutorial Sample App"

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{title}"

  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{title}"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{title}"
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "Contact | Ruby on Rails Tutorial Sample App"
  end

end
