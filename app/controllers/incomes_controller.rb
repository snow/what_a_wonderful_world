class IncomesController < ApplicationController
  before_action :set_income, only: [:show, :edit, :update, :destroy]
  before_action :set_profile, only: [:new, :create]

  # # GET /incomes
  # # GET /incomes.json
  # def index
  #   @incomes = Income.all
  # end

  # # GET /incomes/1
  # # GET /incomes/1.json
  # def show
  # end

  # GET /incomes/new
  def new
    @income = Income.new
  end

  # GET /incomes/1/edit
  def edit
  end

  # POST /incomes
  # POST /incomes.json
  def create
    @income = Income.new(income_params.merge(profile: @profile,
                                             category: :one_time))

    respond_to do |format|
      if @income.save
        format.html { redirect_to profile_path(@profile), notice: 'Income was successfully created.' }
        format.json { render :show, status: :created, location: profile_path(@profile) }
      else
        format.html { render :new }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incomes/1
  # PATCH/PUT /incomes/1.json
  def update
    respond_to do |format|
      if @income.update(income_params)
        format.html { redirect_to profile_path(@income.profile), notice: 'Income was successfully updated.' }
        format.json { render :show, status: :ok, location: profile_path(@income.profile) }
      else
        format.html { render :edit }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incomes/1
  # DELETE /incomes/1.json
  def destroy
    @income.destroy
    respond_to do |format|
      format.html { redirect_to profile_path(@income.profile), notice: 'Income was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_income
    @income = Income.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def income_params
    params.require(:income).permit(:name, :amount, :date)
  end
end
