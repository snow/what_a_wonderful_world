class PeriodicIncomesController < ApplicationController
  before_action :set_periodic_income, only: [:show, :edit, :update, :destroy]
  before_action :set_profile, only: [:new, :create]

  # # GET /periodic_incomes
  # # GET /periodic_incomes.json
  # def index
  #   @periodic_incomes = PeriodicIncome.all
  # end
  #
  # # GET /periodic_incomes/1
  # # GET /periodic_incomes/1.json
  # def show
  # end

  # GET /periodic_incomes/new
  def new
    @periodic_income = PeriodicIncome.new
  end

  # GET /periodic_incomes/1/edit
  def edit
  end

  # POST /periodic_incomes
  # POST /periodic_incomes.json
  def create
    @periodic_income = PeriodicIncome.new(periodic_income_params.merge(profile: @profile))

    respond_to do |format|
      if @periodic_income.save
        format.html { redirect_to profile_path(@profile), notice: 'Periodic income was successfully created.' }
        format.json { render :show, status: :created, location: profile_path(@profile) }
      else
        format.html { render :new }
        format.json { render json: @periodic_income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /periodic_incomes/1
  # PATCH/PUT /periodic_incomes/1.json
  def update
    respond_to do |format|
      if @periodic_income.update(periodic_income_params)
        format.html { redirect_to profile_path(@periodic_income.profile), notice: 'Periodic income was successfully updated.' }
        format.json { render :show, status: :ok, location: profile_path(@periodic_income.profile) }
      else
        format.html { render :edit }
        format.json { render json: @periodic_income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /periodic_incomes/1
  # DELETE /periodic_incomes/1.json
  def destroy
    @periodic_income.destroy
    respond_to do |format|
      format.html { redirect_to profile_path(@periodic_income.profile), notice: 'Periodic income was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_periodic_income
    @periodic_income = PeriodicIncome.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def periodic_income_params
    params.require(:periodic_income).permit(:name, :period, :starts_at, :ends_at, :period_amount)
  end
end
