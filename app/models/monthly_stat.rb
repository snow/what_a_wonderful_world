# == Schema Information
#
# Table name: monthly_stats
#
#  id           :integer          not null, primary key
#  profile_id   :integer
#  date         :datetime
#  balance_cent :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_monthly_stats_on_profile_id_and_date  (profile_id,date) UNIQUE
#

class MonthlyStat < ApplicationRecord
  belongs_to :profile, inverse_of: :monthly_stats
  has_many :incomes, inverse_of: :monthly_stat
  has_many :expenses, inverse_of: :monthly_stat

  after_initialize :defaults

  validates :date, :balance_cent, presence: true

  private

  def defaults
    self.balance_cent = 0 if has_attribute?(:balance_cent) && balance_cent.nil?
  end
end
