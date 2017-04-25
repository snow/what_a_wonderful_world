# == Schema Information
#
# Table name: incomes
#
#  id                 :integer          not null, primary key
#  profile_id         :integer
#  name               :string(191)
#  category           :integer
#  amount_cent        :integer
#  date               :datetime
#  monthly_stat_id    :integer
#  periodic_income_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Income < ApplicationRecord
  belongs_to :profile, inverse_of: :incomes
  belongs_to :monthly_stat, optional: true, inverse_of: :incomes
  belongs_to :periodic_income, optional: true, inverse_of: :incomes

  enum category: [:one_time, :periodic]

  after_initialize :defaults

  validates :category, :amount_cent, :date, presence: true
  validates :periodic_income, presence: true, if: :periodic?

  private

  def defaults
    self.category = :one_time if has_attribute?(:category) && category.nil?
  end
end
