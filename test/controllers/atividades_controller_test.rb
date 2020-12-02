require 'test_helper'

class AtividadesControllerTest < ActionController::TestCase
  setup do
    @atividade = atividades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:atividades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atividade" do
    assert_difference('Atividade.count') do
      post :create, atividade: { aluno_id: @atividade.aluno_id, anexo: @atividade.anexo, descricao: @atividade.descricao, horas_jul: @atividade.horas_jul, horas_req: @atividade.horas_req, julgador_id: @atividade.julgador_id, modalidade_id: @atividade.modalidade_id }
    end

    assert_redirected_to atividade_path(assigns(:atividade))
  end

  test "should show atividade" do
    get :show, id: @atividade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @atividade
    assert_response :success
  end

  test "should update atividade" do
    patch :update, id: @atividade, atividade: { aluno_id: @atividade.aluno_id, anexo: @atividade.anexo, descricao: @atividade.descricao, horas_jul: @atividade.horas_jul, horas_req: @atividade.horas_req, julgador_id: @atividade.julgador_id, modalidade_id: @atividade.modalidade_id }
    assert_redirected_to atividade_path(assigns(:atividade))
  end

  test "should destroy atividade" do
    assert_difference('Atividade.count', -1) do
      delete :destroy, id: @atividade
    end

    assert_redirected_to atividades_path
  end
end
