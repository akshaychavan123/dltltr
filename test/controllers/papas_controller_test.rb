require "test_helper"

class PapasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @papa = papas(:one)
  end

  test "should get index" do
    get papas_url
    assert_response :success
  end

  test "should get new" do
    get new_papa_url
    assert_response :success
  end

  test "should create papa" do
    assert_difference("Papa.count") do
      post papas_url, params: { papa: { name: @papa.name } }
    end

    assert_redirected_to papa_url(Papa.last)
  end

  test "should show papa" do
    get papa_url(@papa)
    assert_response :success
  end

  test "should get edit" do
    get edit_papa_url(@papa)
    assert_response :success
  end

  test "should update papa" do
    patch papa_url(@papa), params: { papa: { name: @papa.name } }
    assert_redirected_to papa_url(@papa)
  end

  test "should destroy papa" do
    assert_difference("Papa.count", -1) do
      delete papa_url(@papa)
    end

    assert_redirected_to papas_url
  end
end
