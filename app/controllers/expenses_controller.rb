class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :set_profile, only: [:new, :create]

  # GET /expenses
  # GET /expenses.json
  # def index
  #   @expenses = Expense.all
  # end

  # GET /expenses/1
  # GET /expenses/1.json
  # def show
  # end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(expense_params.merge(profile: @profile,
                                                category: :one_time))

    respond_to do |format|
      if @expense.save
        format.html { redirect_to profile_path(@profile), notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: profile_path(@profile) }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to profile_path(@expense.profile), notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: profile_path(@expense.profile) }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to profile_path(@expense.profile), notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def expense_params
    params.require(:expense).permit(:name, :amount, :date)
  end
end
