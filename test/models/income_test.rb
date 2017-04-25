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

require 'test_helper'

class IncomeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
