require 'test_helper'

class PeriodicIncomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @periodic_income = periodic_incomes(:one)
  end

  test "should get index" do
    get periodic_incomes_url
    assert_response :success
  end

  test "should get new" do
    get new_periodic_income_url
    assert_response :success
  end

  test "should create periodic_income" do
    assert_difference('PeriodicIncome.count') do
      post periodic_incomes_url, params: { periodic_income: { ends_at: @periodic_income.ends_at, name: @periodic_income.name, period: @periodic_income.period, period_amount: @periodic_income.period_amount, starts_at: @periodic_income.starts_at } }
    end

    assert_redirected_to periodic_income_url(PeriodicIncome.last)
  end

  test "should show periodic_income" do
    get periodic_income_url(@periodic_income)
    assert_response :success
  end

  test "should get edit" do
    get edit_periodic_income_url(@periodic_income)
    assert_response :success
  end

  test "should update periodic_income" do
    patch periodic_income_url(@periodic_income), params: { periodic_income: { ends_at: @periodic_income.ends_at, name: @periodic_income.name, period: @periodic_income.period, period_amount: @periodic_income.period_amount, starts_at: @periodic_income.starts_at } }
    assert_redirected_to periodic_income_url(@periodic_income)
  end

  test "should destroy periodic_income" do
    assert_difference('PeriodicIncome.count', -1) do
      delete periodic_income_url(@periodic_income)
    end

    assert_redirected_to periodic_incomes_url
  end
end
