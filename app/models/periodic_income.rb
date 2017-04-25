# == Schema Information
#
# Table name: periodic_incomes
#
#  id                 :integer          not null, primary key
#  profile_id         :integer
#  name               :string(191)
#  period             :integer
#  starts_at          :datetime
#  ends_at            :datetime
#  period_amount_cent :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class PeriodicIncome < ApplicationRecord
  belongs_to :profile
  has_many :incomes, inverse_of: :periodic_income, dependent: :destroy

  enum period: [:month, :year]

  validates :period, :starts_at, :ends_at, :period_amount_cent, presence: true

  after_create :generate_incomes!
  after_update :regenerate_incomes!

  def generate_incomes!
    Recurrence.new(every: period, on: 1,
                   starts: starts_at, until: ends_at).map do |date|
      incomes.create!(profile: profile,
                      name: "#{name}-#{date}",
                      category: :periodic,
                      amount_cent: period_amount_cent,
                      date: date)
    end
  end

  def regenerate_incomes!
    regenerate_if = %w(profile_id period starts_at ends_at period_amount_cent)
    return unless (changes.keys & regenerate_if).any?
    incomes.destroy_all
    generate_incomes!
  end

end
