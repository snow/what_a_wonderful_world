class MonthlyStatsController < ApplicationController
  before_action :set_profile

  # GET /monthly_stats
  # GET /monthly_stats.json
  def index
    # TODO: paginate?
    @monthly_stats = @profile.monthly_stats.order :date
  end

  def regenerate
    RegenerateMonthlyStats.new(@profile).perform
    redirect_to profile_monthly_stats_path(@profile), notice: 'done'
  end

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

end
