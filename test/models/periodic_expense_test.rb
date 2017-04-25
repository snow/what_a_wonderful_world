# == Schema Information
#
# Table name: periodic_expenses
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

require 'test_helper'

class PeriodicExpenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
