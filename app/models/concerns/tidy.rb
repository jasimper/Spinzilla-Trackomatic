module Tidy
  extend ActiveSupport::Concern

  def drop_trailing_zero(num)
    i, f = num.to_i, num.to_f
    i == f ? i : f
  end

end
