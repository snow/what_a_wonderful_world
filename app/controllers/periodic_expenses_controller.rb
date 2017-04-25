class PeriodicExpensesController < ApplicationController
  before_action :set_periodic_expense, only: [:show, :edit, :update, :destroy]
  before_action :set_profile, only: [:new, :create]

  # GET /periodic_expenses
  # GET /periodic_expenses.json
  # def index
  #   @periodic_expenses = PeriodicExpense.all
  # end

  # GET /periodic_expenses/1
  # GET /periodic_expenses/1.json
  # def show
  # end

  # GET /periodic_expenses/new
  def new
    @periodic_expense = PeriodicExpense.new
  end

  # GET /periodic_expenses/1/edit
  def edit
  end

  # POST /periodic_expenses
  # POST /periodic_expenses.json
  def create
    @periodic_expense = PeriodicExpense.new(periodic_expense_params.merge(profile: @profile))

    respond_to do |format|
      if @periodic_expense.save
        format.html { redirect_to profile_path(@profile), notice: 'Periodic expense was successfully created.' }
        format.json { render :show, status: :created, location: profile_path(@profile) }
      else
        format.html { render :new }
        format.json { render json: @periodic_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /periodic_expenses/1
  # PATCH/PUT /periodic_expenses/1.json
  def update
    respond_to do |format|
      if @periodic_expense.update(periodic_expense_params)
        format.html { redirect_to profile_path(@periodic_expense.profile), notice: 'Periodic expense was successfully updated.' }
        format.json { render :show, status: :ok, location: profile_path(@periodic_expense.profile) }
      else
        format.html { render :edit }
        format.json { render json: @periodic_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /periodic_expenses/1
  # DELETE /periodic_expenses/1.json
  def destroy
    @periodic_expense.destroy
    respond_to do |format|
      format.html { redirect_to profile_path(@periodic_expense.profile), notice: 'Periodic expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_periodic_expense
    @periodic_expense = PeriodicExpense.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def periodic_expense_params
    params.require(:periodic_expense).permit(:name, :period, :starts_at, :ends_at, :period_amount)
  end
end
