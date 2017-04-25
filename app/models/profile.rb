# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  name       :string(191)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Profile < ApplicationRecord
  has_many :incomes, dependent: :destroy
  has_many :periodic_incomes, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :periodic_expenses, dependent: :destroy
  has_many :monthly_stats, dependent: :destroy

  validates :name, presence: true
end
