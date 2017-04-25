require 'test_helper'

class MonthlyStatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monthly_stat = monthly_stats(:one)
  end

  test "should get index" do
    get monthly_stats_url
    assert_response :success
  end

  test "should get new" do
    get new_monthly_stat_url
    assert_response :success
  end

  test "should create monthly_stat" do
    assert_difference('MonthlyStat.count') do
      post monthly_stats_url, params: { monthly_stat: {  } }
    end

    assert_redirected_to monthly_stat_url(MonthlyStat.last)
  end

  test "should show monthly_stat" do
    get monthly_stat_url(@monthly_stat)
    assert_response :success
  end

  test "should get edit" do
    get edit_monthly_stat_url(@monthly_stat)
    assert_response :success
  end

  test "should update monthly_stat" do
    patch monthly_stat_url(@monthly_stat), params: { monthly_stat: {  } }
    assert_redirected_to monthly_stat_url(@monthly_stat)
  end

  test "should destroy monthly_stat" do
    assert_difference('MonthlyStat.count', -1) do
      delete monthly_stat_url(@monthly_stat)
    end

    assert_redirected_to monthly_stats_url
  end
end
