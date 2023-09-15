require "test_helper"

class BdleiturasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bdleitura = bdleituras(:one)
  end

  test "should get index" do
    get bdleituras_url
    assert_response :success
  end

  test "should get new" do
    get new_bdleitura_url
    assert_response :success
  end

  test "should create bdleitura" do
    assert_difference("Bdleitura.count") do
      post bdleituras_url, params: { bdleitura: { bdsensor_id: @bdleitura.bdsensor_id, valor: @bdleitura.valor } }
    end

    assert_redirected_to bdleitura_url(Bdleitura.last)
  end

  test "should show bdleitura" do
    get bdleitura_url(@bdleitura)
    assert_response :success
  end

  test "should get edit" do
    get edit_bdleitura_url(@bdleitura)
    assert_response :success
  end

  test "should update bdleitura" do
    patch bdleitura_url(@bdleitura), params: { bdleitura: { bdsensor_id: @bdleitura.bdsensor_id, valor: @bdleitura.valor } }
    assert_redirected_to bdleitura_url(@bdleitura)
  end

  test "should destroy bdleitura" do
    assert_difference("Bdleitura.count", -1) do
      delete bdleitura_url(@bdleitura)
    end

    assert_redirected_to bdleituras_url
  end
end
