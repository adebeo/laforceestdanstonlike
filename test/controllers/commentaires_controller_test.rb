require 'test_helper'

class CommentairesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @commentaire = commentaires(:one)
  end

  test "should get index" do
    get commentaires_url
    assert_response :success
  end

  test "should get new" do
    get new_commentaire_url
    assert_response :success
  end

  test "should create commentaire" do
    assert_difference('Commentaire.count') do
      post commentaires_url, params: { commentaire: { comment: @commentaire.comment } }
    end

    assert_redirected_to commentaire_url(Commentaire.last)
  end

  test "should show commentaire" do
    get commentaire_url(@commentaire)
    assert_response :success
  end

  test "should get edit" do
    get edit_commentaire_url(@commentaire)
    assert_response :success
  end

  test "should update commentaire" do
    patch commentaire_url(@commentaire), params: { commentaire: { comment: @commentaire.comment } }
    assert_redirected_to commentaire_url(@commentaire)
  end

  test "should destroy commentaire" do
    assert_difference('Commentaire.count', -1) do
      delete commentaire_url(@commentaire)
    end

    assert_redirected_to commentaires_url
  end
end
