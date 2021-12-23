require 'test_helper'

class SourceFrancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @source_france = source_frances(:one)
  end

  test "should get index" do
    get source_frances_url
    assert_response :success
  end

  test "should get new" do
    get new_source_france_url
    assert_response :success
  end

  test "should create source_france" do
    assert_difference('SourceFrance.count') do
      post source_frances_url, params: { source_france: { cod_0: @source_france.cod_0, cod_1: @source_france.cod_1, cod_10: @source_france.cod_10, cod_11: @source_france.cod_11, cod_2: @source_france.cod_2, cod_3: @source_france.cod_3, cod_4: @source_france.cod_4, cod_5: @source_france.cod_5, cod_6: @source_france.cod_6, cod_7: @source_france.cod_7, cod_8: @source_france.cod_8, cod_9: @source_france.cod_9, isin: @source_france.isin, name: @source_france.name, url_0: @source_france.url_0, url_1: @source_france.url_1, url_10: @source_france.url_10, url_11: @source_france.url_11, url_2: @source_france.url_2, url_3: @source_france.url_3, url_4: @source_france.url_4, url_5: @source_france.url_5, url_6: @source_france.url_6, url_7: @source_france.url_7, url_8: @source_france.url_8, url_9: @source_france.url_9 } }
    end

    assert_redirected_to source_france_url(SourceFrance.last)
  end

  test "should show source_france" do
    get source_france_url(@source_france)
    assert_response :success
  end

  test "should get edit" do
    get edit_source_france_url(@source_france)
    assert_response :success
  end

  test "should update source_france" do
    patch source_france_url(@source_france), params: { source_france: { cod_0: @source_france.cod_0, cod_1: @source_france.cod_1, cod_10: @source_france.cod_10, cod_11: @source_france.cod_11, cod_2: @source_france.cod_2, cod_3: @source_france.cod_3, cod_4: @source_france.cod_4, cod_5: @source_france.cod_5, cod_6: @source_france.cod_6, cod_7: @source_france.cod_7, cod_8: @source_france.cod_8, cod_9: @source_france.cod_9, isin: @source_france.isin, name: @source_france.name, url_0: @source_france.url_0, url_1: @source_france.url_1, url_10: @source_france.url_10, url_11: @source_france.url_11, url_2: @source_france.url_2, url_3: @source_france.url_3, url_4: @source_france.url_4, url_5: @source_france.url_5, url_6: @source_france.url_6, url_7: @source_france.url_7, url_8: @source_france.url_8, url_9: @source_france.url_9 } }
    assert_redirected_to source_france_url(@source_france)
  end

  test "should destroy source_france" do
    assert_difference('SourceFrance.count', -1) do
      delete source_france_url(@source_france)
    end

    assert_redirected_to source_frances_url
  end
end
