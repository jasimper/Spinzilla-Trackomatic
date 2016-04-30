require "administrate/field/base"

class AdminField < Administrate::Field::Base
  def to_s
    data
  end
end
