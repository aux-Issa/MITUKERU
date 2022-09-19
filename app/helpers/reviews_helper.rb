# frozen_string_literal: true

module ReviewsHelper
  def diff_month(date1, date2)
    ((date2.year * 12) + date2.month) - ((date1.year * 12) + date1.month)
  end
end
