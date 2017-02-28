require 'test_helper'

class CreateCommentaireTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @create_commentaire_table = create_commentaire_tables(:one)
  end

  test "should get index" do
    get create_commentaire_tables_url
    assert_response :success
  end

  test "should get new" do
    get new_create_commentaire_table_url
    assert_response :success
  end

  test "should create create_commentaire_table" do
    assert_difference('CreateCommentaireTable.count') do
      post create_commentaire_tables_url, params: { create_commentaire_table: { comment: @create_commentaire_table.comment } }
    end

    assert_redirected_to create_commentaire_table_url(CreateCommentaireTable.last)
  end

  test "should show create_commentaire_table" do
    get create_commentaire_table_url(@create_commentaire_table)
    assert_response :success
  end

  test "should get edit" do
    get edit_create_commentaire_table_url(@create_commentaire_table)
    assert_response :success
  end

  test "should update create_commentaire_table" do
    patch create_commentaire_table_url(@create_commentaire_table), params: { create_commentaire_table: { comment: @create_commentaire_table.comment } }
    assert_redirected_to create_commentaire_table_url(@create_commentaire_table)
  end

  test "should destroy create_commentaire_table" do
    assert_difference('CreateCommentaireTable.count', -1) do
      delete create_commentaire_table_url(@create_commentaire_table)
    end

    assert_redirected_to create_commentaire_tables_url
  end
end
