# == Schema Information
#
# Table name: expenses
#
#  id                  :integer          not null, primary key
#  profile_id          :integer
#  name                :string(191)
#  category            :integer
#  amount_cent         :integer
#  date                :datetime
#  monthly_stat_id     :integer
#  periodic_expense_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Expense < ApplicationRecord
  belongs_to :profile, inverse_of: :expenses
  belongs_to :monthly_stat, optional: true, inverse_of: :expenses
  belongs_to :periodic_expense, optional: true, inverse_of: :expenses

  enum category: [:one_time, :periodic]

  after_initialize :defaults
  # TODO: should do these in controller
  before_save do
    self.date = date.beginning_of_month
  end

  validates :category, :amount_cent, :date, presence: true
  validates :periodic_expense, presence: true, if: :periodic?

  def amount
    amount_cent / 100 if amount_cent
  end

  def amount=(other_amount)
    self.amount_cent = other_amount.to_i * 100
  end

  private

  def defaults
    self.category = :one_time if has_attribute?(:category) && category.nil?
  end
end
