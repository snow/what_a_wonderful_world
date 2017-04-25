require 'test_helper'

class PeriodicExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @periodic_expense = periodic_expenses(:one)
  end

  test "should get index" do
    get periodic_expenses_url
    assert_response :success
  end

  test "should get new" do
    get new_periodic_expense_url
    assert_response :success
  end

  test "should create periodic_expense" do
    assert_difference('PeriodicExpense.count') do
      post periodic_expenses_url, params: { periodic_expense: { ends_at: @periodic_expense.ends_at, name: @periodic_expense.name, period: @periodic_expense.period, period_amount: @periodic_expense.period_amount, starts_at: @periodic_expense.starts_at } }
    end

    assert_redirected_to periodic_expense_url(PeriodicExpense.last)
  end

  test "should show periodic_expense" do
    get periodic_expense_url(@periodic_expense)
    assert_response :success
  end

  test "should get edit" do
    get edit_periodic_expense_url(@periodic_expense)
    assert_response :success
  end

  test "should update periodic_expense" do
    patch periodic_expense_url(@periodic_expense), params: { periodic_expense: { ends_at: @periodic_expense.ends_at, name: @periodic_expense.name, period: @periodic_expense.period, period_amount: @periodic_expense.period_amount, starts_at: @periodic_expense.starts_at } }
    assert_redirected_to periodic_expense_url(@periodic_expense)
  end

  test "should destroy periodic_expense" do
    assert_difference('PeriodicExpense.count', -1) do
      delete periodic_expense_url(@periodic_expense)
    end

    assert_redirected_to periodic_expenses_url
  end
end
