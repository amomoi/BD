require "test_helper"

class BdsensorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bdsensor = bdsensors(:one)
  end

  test "should get index" do
    get bdsensors_url
    assert_response :success
  end

  test "should get new" do
    get new_bdsensor_url
    assert_response :success
  end

  test "should create bdsensor" do
    assert_difference("Bdsensor.count") do
      post bdsensors_url, params: { bdsensor: { LI: @bdsensor.LI, LS: @bdsensor.LS, arg1: @bdsensor.arg1, arg2: @bdsensor.arg2, arg3: @bdsensor.arg3, arg4: @bdsensor.arg4, arg5: @bdsensor.arg5, ativo_inativo: @bdsensor.ativo_inativo, bdcliente_id: @bdsensor.bdcliente_id, bdtipo_id: @bdsensor.bdtipo_id, flag_mantec: @bdsensor.flag_mantec, flag_notificacao: @bdsensor.flag_notificacao, flag_rearme: @bdsensor.flag_rearme, nome_sensor: @bdsensor.nome_sensor, time_read: @bdsensor.time_read } }
    end

    assert_redirected_to bdsensor_url(Bdsensor.last)
  end

  test "should show bdsensor" do
    get bdsensor_url(@bdsensor)
    assert_response :success
  end

  test "should get edit" do
    get edit_bdsensor_url(@bdsensor)
    assert_response :success
  end

  test "should update bdsensor" do
    patch bdsensor_url(@bdsensor), params: { bdsensor: { LI: @bdsensor.LI, LS: @bdsensor.LS, arg1: @bdsensor.arg1, arg2: @bdsensor.arg2, arg3: @bdsensor.arg3, arg4: @bdsensor.arg4, arg5: @bdsensor.arg5, ativo_inativo: @bdsensor.ativo_inativo, bdcliente_id: @bdsensor.bdcliente_id, bdtipo_id: @bdsensor.bdtipo_id, flag_mantec: @bdsensor.flag_mantec, flag_notificacao: @bdsensor.flag_notificacao, flag_rearme: @bdsensor.flag_rearme, nome_sensor: @bdsensor.nome_sensor, time_read: @bdsensor.time_read } }
    assert_redirected_to bdsensor_url(@bdsensor)
  end

  test "should destroy bdsensor" do
    assert_difference("Bdsensor.count", -1) do
      delete bdsensor_url(@bdsensor)
    end

    assert_redirected_to bdsensors_url
  end
end
