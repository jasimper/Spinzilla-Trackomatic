module Tidy
  extend ActiveSupport::Concern

  # Much love to sawa on stackoverflow!
  # http://stackoverflow.com/a/18533211/6094225
  def drop_trailing_zero(num)
    i, f = num.to_i, num.to_f
    i == f ? i : f
  end

end
