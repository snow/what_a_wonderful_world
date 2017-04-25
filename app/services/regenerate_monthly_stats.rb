class RegenerateMonthlyStats
  def initialize(profile)
    @profile = profile
  end

  def perform
    ActiveRecord::Base.transaction do
      @profile.monthly_stats.destroy_all

      Recurrence.new(every: :month, on: 1,
                     starts: starts_at, until: ends_at).map do |date|
        stat = @profile.monthly_stats.create!(date: date)
        @profile.incomes.where(date: date).update_all monthly_stat_id: stat.id
        @profile.expenses.where(date: date).update_all monthly_stat_id: stat.id
      end

      last_stat = nil
      @profile.monthly_stats.each do |stat|
        stat.balance_cent = last_stat.balance_cent if last_stat
        stat.balance_cent += stat.incomes.sum :amount_cent
        stat.balance_cent -= stat.expenses.sum :amount_cent
        stat.save!
        last_stat = stat
      end
    end
  end

  def starts_at
    @starts_at ||= [@profile.incomes.minimum(:date),
                    @profile.expenses.minimum(:date)].min
  end

  def ends_at
    @ends_at ||= [@profile.incomes.maximum(:date),
                  @profile.expenses.maximum(:date)].max
  end
end
