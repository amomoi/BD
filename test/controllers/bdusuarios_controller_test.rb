require "test_helper"

class BdusuariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bdusuario = bdusuarios(:one)
  end

  test "should get index" do
    get bdusuarios_url
    assert_response :success
  end

  test "should get new" do
    get new_bdusuario_url
    assert_response :success
  end

  test "should create bdusuario" do
    assert_difference("Bdusuario.count") do
      post bdusuarios_url, params: { bdusuario: { CPF: @bdusuario.CPF, SMS: @bdusuario.SMS, ativo_inativo: @bdusuario.ativo_inativo, bdcliente_id: @bdusuario.bdcliente_id, celular: @bdusuario.celular, email: @bdusuario.email, nome: @bdusuario.nome, senha: @bdusuario.senha } }
    end

    assert_redirected_to bdusuario_url(Bdusuario.last)
  end

  test "should show bdusuario" do
    get bdusuario_url(@bdusuario)
    assert_response :success
  end

  test "should get edit" do
    get edit_bdusuario_url(@bdusuario)
    assert_response :success
  end

  test "should update bdusuario" do
    patch bdusuario_url(@bdusuario), params: { bdusuario: { CPF: @bdusuario.CPF, SMS: @bdusuario.SMS, ativo_inativo: @bdusuario.ativo_inativo, bdcliente_id: @bdusuario.bdcliente_id, celular: @bdusuario.celular, email: @bdusuario.email, nome: @bdusuario.nome, senha: @bdusuario.senha } }
    assert_redirected_to bdusuario_url(@bdusuario)
  end

  test "should destroy bdusuario" do
    assert_difference("Bdusuario.count", -1) do
      delete bdusuario_url(@bdusuario)
    end

    assert_redirected_to bdusuarios_url
  end
end
