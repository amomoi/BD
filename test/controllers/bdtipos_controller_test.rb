require "test_helper"

class BdtiposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bdtipo = bdtipos(:one)
  end

  test "should get index" do
    get bdtipos_url
    assert_response :success
  end

  test "should get new" do
    get new_bdtipo_url
    assert_response :success
  end

  test "should create bdtipo" do
    assert_difference("Bdtipo.count") do
      post bdtipos_url, params: { bdtipo: { tipo_sensor: @bdtipo.tipo_sensor } }
    end

    assert_redirected_to bdtipo_url(Bdtipo.last)
  end

  test "should show bdtipo" do
    get bdtipo_url(@bdtipo)
    assert_response :success
  end

  test "should get edit" do
    get edit_bdtipo_url(@bdtipo)
    assert_response :success
  end

  test "should update bdtipo" do
    patch bdtipo_url(@bdtipo), params: { bdtipo: { tipo_sensor: @bdtipo.tipo_sensor } }
    assert_redirected_to bdtipo_url(@bdtipo)
  end

  test "should destroy bdtipo" do
    assert_difference("Bdtipo.count", -1) do
      delete bdtipo_url(@bdtipo)
    end

    assert_redirected_to bdtipos_url
  end
end
