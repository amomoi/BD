require "test_helper"

class BdclientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bdcliente = bdclientes(:one)
  end

  test "should get index" do
    get bdclientes_url
    assert_response :success
  end

  test "should get new" do
    get new_bdcliente_url
    assert_response :success
  end

  test "should create bdcliente" do
    assert_difference("Bdcliente.count") do
      post bdclientes_url, params: { bdcliente: { ativo_inativo: @bdcliente.ativo_inativo, nome_empresa: @bdcliente.nome_empresa, site: @bdcliente.site } }
    end

    assert_redirected_to bdcliente_url(Bdcliente.last)
  end

  test "should show bdcliente" do
    get bdcliente_url(@bdcliente)
    assert_response :success
  end

  test "should get edit" do
    get edit_bdcliente_url(@bdcliente)
    assert_response :success
  end

  test "should update bdcliente" do
    patch bdcliente_url(@bdcliente), params: { bdcliente: { ativo_inativo: @bdcliente.ativo_inativo, nome_empresa: @bdcliente.nome_empresa, site: @bdcliente.site } }
    assert_redirected_to bdcliente_url(@bdcliente)
  end

  test "should destroy bdcliente" do
    assert_difference("Bdcliente.count", -1) do
      delete bdcliente_url(@bdcliente)
    end

    assert_redirected_to bdclientes_url
  end
end
