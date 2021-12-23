require 'test_helper'

class SourceItaliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @source_italy = source_italies(:one)
  end

  test "should get index" do
    get source_italies_url
    assert_response :success
  end

  test "should get new" do
    get new_source_italy_url
    assert_response :success
  end

  test "should create source_italy" do
    assert_difference('SourceItaly.count') do
      post source_italies_url, params: { source_italy: { cod_0: @source_italy.cod_0, cod_1: @source_italy.cod_1, cod_10: @source_italy.cod_10, cod_11: @source_italy.cod_11, cod_2: @source_italy.cod_2, cod_3: @source_italy.cod_3, cod_4: @source_italy.cod_4, cod_5: @source_italy.cod_5, cod_6: @source_italy.cod_6, cod_7: @source_italy.cod_7, cod_8: @source_italy.cod_8, cod_9: @source_italy.cod_9, isin: @source_italy.isin, name: @source_italy.name, url_0: @source_italy.url_0, url_1: @source_italy.url_1, url_10: @source_italy.url_10, url_11: @source_italy.url_11, url_2: @source_italy.url_2, url_3: @source_italy.url_3, url_4: @source_italy.url_4, url_5: @source_italy.url_5, url_6: @source_italy.url_6, url_7: @source_italy.url_7, url_8: @source_italy.url_8, url_9: @source_italy.url_9 } }
    end

    assert_redirected_to source_italy_url(SourceItaly.last)
  end

  test "should show source_italy" do
    get source_italy_url(@source_italy)
    assert_response :success
  end

  test "should get edit" do
    get edit_source_italy_url(@source_italy)
    assert_response :success
  end

  test "should update source_italy" do
    patch source_italy_url(@source_italy), params: { source_italy: { cod_0: @source_italy.cod_0, cod_1: @source_italy.cod_1, cod_10: @source_italy.cod_10, cod_11: @source_italy.cod_11, cod_2: @source_italy.cod_2, cod_3: @source_italy.cod_3, cod_4: @source_italy.cod_4, cod_5: @source_italy.cod_5, cod_6: @source_italy.cod_6, cod_7: @source_italy.cod_7, cod_8: @source_italy.cod_8, cod_9: @source_italy.cod_9, isin: @source_italy.isin, name: @source_italy.name, url_0: @source_italy.url_0, url_1: @source_italy.url_1, url_10: @source_italy.url_10, url_11: @source_italy.url_11, url_2: @source_italy.url_2, url_3: @source_italy.url_3, url_4: @source_italy.url_4, url_5: @source_italy.url_5, url_6: @source_italy.url_6, url_7: @source_italy.url_7, url_8: @source_italy.url_8, url_9: @source_italy.url_9 } }
    assert_redirected_to source_italy_url(@source_italy)
  end

  test "should destroy source_italy" do
    assert_difference('SourceItaly.count', -1) do
      delete source_italy_url(@source_italy)
    end

    assert_redirected_to source_italies_url
  end
end
