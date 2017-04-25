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

require 'test_helper'

class MonthlyStatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
